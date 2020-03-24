
zipped_files <- unzip(
  file.path('data', 'CORD-19-research-challenge.zip')
  , exdir = 'data'
)

save(
  file = file.path('data', 'unzip.rda')
  , zipped_files
)
