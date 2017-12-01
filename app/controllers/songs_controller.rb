class SongsController < ApplicationController

	def index
    @songs = Song.all
 	end

  def new
   	@song = Song.new
    @vibes = Vibe.all
  end

  def create
    # binding.pry
   	@song = current_user.songs.build(song_params)
    if @song.save
      redirect_to user_path(current_user)
    else
      render :new
    end
  end

  def show
  	@song = Song.find(params[:id])
  end

  def edit
    @song = Song.find(params[:id])
  end

  def update

    @song = Song.find(params[:id])
    binding.pry
    redirect_to song_path(@song)
  end

  def destroy
    # what is @song here though?
    Song.find(params[:id]).destroy
    redirect_to user_path(current_user)

  end

  private

  	def song_params
      params.require(:song).permit(:name, :artist, song_vibes_attributes: [:level, vibe_attributes: [:name]])
    end

end