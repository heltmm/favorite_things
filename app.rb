require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/item')
require('pry')

get('/') do
  @list = Item.all()
  erb(:list)
end

post('/') do
  name = params["name"]
  rank = params["rank"]
  del_name = params["del_name"]
  item = Item.new(name, rank)

  item.update()
  item.save()

  @list = Item.sort
  erb(:list)
end

post('/delete') do
  del_name = params["del_name"]
  Item.delete(del_name)
  @list = Item.sort
  erb(:list)
end

get('/items/:id') do
  @item = Item.find(params[:id])
  erb(:item)
end

post('/change') do

  name = params["name"]
  rank = params["rank"]

  item = Item.new(name, rank)

  item.update()
  item.save()
  Item.sort

  @list = Item.all
  erb(:list)
end
