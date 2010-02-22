# Article.find(:all, :order => "published_at desc", :limit => 10)
Article.order("published_at desc").limit(10)


# Article.find(:all, :conditions => ["published_at <= ?", Time.now], :include => :comments)
Article.where("published_at <= ?", Time.now).includes(:comments)


# Article.find(:first, :order => "published_at desc")
Article.order("published_at").last
