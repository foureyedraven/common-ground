class StaticPagesController < ApplicationController
  def home
    @postlets = BlogPost.published.order('id desc').limit(5)
  end

  def math
  end

  def studyguides
  end

  def contact
  end

  def longreads
  end
end
