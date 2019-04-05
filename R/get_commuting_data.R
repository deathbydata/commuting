# Function to retrieve and format commuting data
get_commuting_data <- function(commuting_sheet_key) {
  commuting_sheet <- gs_key(commuting_sheet_key)
  
  comm_data <- commuting_sheet %>% gs_read(col_types = list(
    Timestamp = col_character(),
    Date = col_character(),
    Time = col_time(format = ""),
    Direction = col_character(),
    Route = col_character(),
    Duration = col_character(),
    Tram = col_character(),
    Gil = col_character(),
    `Other Info` = col_character()
  ))
}

clean_commuting_data <- function(commuting_data) {
  commuting_data %>%
    mutate(Trip_Date = as.Date(Date, format = "%m/%d/%Y"),
           Trip_Time = Time,
           Trip_Duration_Minutes = (as.numeric(str_sub(Duration, 1, 2))*60 + as.numeric(str_sub(Duration, -2)))/60) %>%
    #select(Trip_Date, Trip_Time, Direction, Route, Trip_Duration_Minutes) %>%
    mutate(Trip_Weekday = weekdays(Trip_Date)) %>%
    mutate(Trip_Weekday = factor(Trip_Weekday, levels(factor(Trip_Weekday))[c(2,4,5,3,1)]),
           Direction = factor(Direction, levels(factor(Direction))[c(2,1)])) %>%
    select(Trip_Date, Trip_Weekday, Trip_Time, Direction, Route, Tram, Trip_Duration_Minutes)
}