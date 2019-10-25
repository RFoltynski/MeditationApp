json.data do
  json.extract! @meditation, :id, :name
  if @meditation.meditationFile.attached?
    json.meditationFile Rails.application.routes.url_helpers.rails_blob_path(@meditation.meditationFile, only_path: true)
  end
end