# == Schema Information
#
# Table name: artists
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Artist < ApplicationRecord
  has_many :albums,
    class_name: 'Album',
    foreign_key: :artist_id,
    primary_key: :id,
    dependent: :destroy

  def n_plus_one_tracks
    my_albums = self.albums
    track_counts = {}
    my_albums.each do |album|
      track_counts[album.title] = album.tracks.length
    end

    track_counts
  end

  def better_tracks_query
    # Your code here
    my_albums = self
    .albums
    .select("albums.*, COUNT(*) AS tracks_count")
    .joins(:tracks)
    .group("albums.id")
    my_albums.map do |album|
      [album.title, album.tracks_count]
    end
  end
end