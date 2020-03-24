library(tidyverse)
library(tidytext)

tbl_metadata <- read_csv(file.path('data', '2020-03-13', 'all_sources_metadata_2020-03-13.csv'))

# Loads of warnings, but we have the proper number of records

names(tbl_metadata)

tbl_metadata %>% 
  count(source_x)

# tbl_metadata %>% 
#   head() %>% 
#   View()

tbl_abstract <- tbl_metadata %>% 
  select(sha, abstract) %>% 
  filter(!is.na(abstract)) 

dtm_abstract <- tbl_abstract %>% 
  unnest_tokens(term, abstract) %>% 
  group_by(sha) %>% 
  count(term) %>% 
  cast_dtm(sha, term, n)

save(
  file = file.path('data', 'all_sources_metadata.rda')
  , tbl_metadata
  , dtm_abstract
  , tbl_abstract
)
