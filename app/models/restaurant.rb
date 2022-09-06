class Restaurant < ApplicationRecord
  has_many :favorites
  validates :name, presence: true
  validates :location, presence: true
  validates :cuisine, presence: true
  validates :name, uniqueness: { scope: :location }
  # validates :phone_number, presence: true

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  CATEGORIES = [
    {name: "Italian", url:"https://images.unsplash.com/photo-1595295333158-4742f28fbd85?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80"},
    {name: "Japanese", url:"https://images.unsplash.com/photo-1580822184713-fc5400e7fe10?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80"},
    {name: "French", url:"https://images.unsplash.com/photo-1554475659-9fd915c8f156?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=464&q=80"},
    {name: "Chinese", url:"https://images.unsplash.com/flagged/photo-1556742524-750f2ab99913?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8Y2hpbmVzZSUyMGZvb2R8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60"},
    {name: "Indonesian", url:"https://images.unsplash.com/photo-1562607635-4608ff48a859?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8aW5kb25lc2lhbiUyMGZvb2R8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60"},
    {name: "Spanish", url:"https://images.unsplash.com/photo-1515443961218-a51367888e4b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80"},
    {name: "Thai", url:"https://images.unsplash.com/photo-1607330289024-1535c6b4e1c1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8dGhhaSUyMGZvb2R8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60"},
    {name:"Indian", url:"https://images.unsplash.com/photo-1585937421612-70a008356fbe?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8aW5kaWFuJTIwZm9vZHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60"},
    {name:"Greek", url:"https://images.unsplash.com/photo-1606735584785-1848fdcaea57?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80"},
    {name:"Bar", url:"https://images.unsplash.com/photo-1582106245687-cbb466a9f07f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8ZHJpbmtzfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60"},
    {name: "Cafe", url:"https://images.unsplash.com/photo-1609590981063-d495e2914ce4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=464&q=80"}
   ]

  BUDGETS = ["$", "$$", "$$$", "$$$$"]

end
