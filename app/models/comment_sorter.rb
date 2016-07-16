class CommentSorter < ApplicationRecord
  attr_accessor :object

  #cs = CommentSorter.new
  #cs.sort_by_most_comments(@assignments)


  def sort_by_most_comments(object)
    object.sort_by { |object| object.comments.count }
  end

  def self.top_five_most_comments
    sort_by_most_comments.first(3)
  end

end