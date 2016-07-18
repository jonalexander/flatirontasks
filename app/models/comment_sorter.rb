class CommentSorter

  def sort_by_most_comments(object)
    object.sort_by { |object| object.comments.count }.reverse!
    #student.all.sort_by { |student| student.comments.count }.reverse!
  end

  def self.top_five_most_comments
    sort_by_most_comments.first(5)
  end

end