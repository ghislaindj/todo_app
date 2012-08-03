atom_feed :language => 'en-US' do |feed|
  feed.title @title
  feed.updated @updated

  @todos.each do |item|
    feed.entry( item ) do |entry|
      entry.category item.category
      entry.body item.body
      entry.due item.due
      entry.done item.done
    end
  end
end