lyrics_data <- read_csv("lyrics-data.csv")
artists_data <- read_csv("artists-data.csv")


################ Data Preprocessing ################
## Selecting desired variables and renaming them from lyrics data
lyrics_data<- lyrics_data %>%
  select(SName, Lyric, language) %>%
  rename(Artist = SName, 
         Lyrics = Lyric)

## Removing non-english lyrics from the dataset
english_lyrics<-lyrics_data %>%
  filter(language == "en") 
  
## Percent of english lyrics in the dataset.
nrow(english_lyrics)/ nrow(lyrics_data) *100

## Selecting desired variables from artists data
artists_data<- artists_data %>%
  select(Artist, Genres) 

## Merging the artists data and the lyrics data
merged_data<-left_join(english_lyrics, artists_data, by = "Artist")

## How many NAs are there for genres?
NAs <- merged_data %>%
  filter(is.na(Genres)) 

## Percent of Missing genres present in the dataset.
nrow(NAs)/ nrow(merged_data) *100