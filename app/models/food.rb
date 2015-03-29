class Food < ActiveRecord::Base
  has_many :daily_servings
  has_many :users, :through => :daily_servings
  
 def self.call_api(query) 
   baseURL = "https://api.nutritionix.com/v1_1/search/"
   appId = ENV["NUTRITIONIX_API_ID"]
   appKey = ENV["NUTRITIONIX_API_KEY"]

   results = Unirest.post baseURL,

   parameters: {
      appId: appId,
      appKey: appKey,  
      fields:["item_name","brand_name","nf_sugars","nf_serving_size_qty"],
      query: query,
      sort:{
        field: "_score",
        order: "desc"
      },
      filters:{
        item_type:2
      }
   }

 results.body["hits"].map do |hit|

    hit["fields"]

   end
 end
end
