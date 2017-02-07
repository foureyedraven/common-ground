class BlogPost < Commonsource::Entry
  searchable_attributes :title, :body
  content_attr :body, :text
end