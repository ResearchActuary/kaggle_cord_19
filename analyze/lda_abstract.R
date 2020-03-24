library(topicmodels)

load(
  file = file.path('data', 'all_sources_metadata.rda')
)

lda_abstract <- LDA(dtm_abstract, k = 2, control = list(seed = 1234))

save(
  file = file.path('analyze', 'lda_abstract.rda')
  , lda_abstract
)
