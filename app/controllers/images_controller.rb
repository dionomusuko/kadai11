class ImagesController < ApplicationController
def index
    @images = Image.order(params[:sort])
end
def new
    @image = Image.new
end
def create
    image = Image.new(title: params[:image][:title], file: params[:image][:file].read)
    image.save
    redirect_to '/'
end
def destroy
    image = Image.find(params[:id])
    image.destroy
    redirect_to '/'
end
def edit
    @image = Image.find(params[:id])
end
def update
    image = Image.find(params[:id])
    title = params[:image][:title]
    file = params[:image][:file].read
    image.update(file: file)
    image.update(title: title)
    redirect_to '/'
end
def get_image
    image = Image.find(params[:id])
    send_data image.file, disposition: :inline, type: 'image/png'
end
end
