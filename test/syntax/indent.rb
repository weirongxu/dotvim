Collection.new(keywords)
  .strip_outer_punctuation
  .tap do |c|
    c.config(
      one: two,
      three: four,
      five: six,
    )
  end
  .config(
    one: two,
    three: four,
    five: six,
  )
  .clean_inner_punctuation
  .remove_stop_words
  .to_a()
