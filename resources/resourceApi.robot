*** Settings ***
Library    RequestsLibrary
Library    Collections
Library    OperatingSystem
Library    JsonValidator
Library    JSONSchemaLibrary   ./resources/schemas

*** Variable ***
${API_KEY}
${API_URL}  http://api.openweathermap.org/data/2.5

*** Keywords ***
search the weather on "${QUERY}"
    Create Session  openWeatherApi      ${API_URL}
    &{PARAMS}       Create Dictionary   q=${QUERY}       APPID=${API_KEY}
    ${RESPONSE}     GET On Session      openWeatherApi  /weather    params=${PARAMS}    expected_status=any
    Set Test Variable   ${RESPONSE}

the status code is "${STATUS_CODE}"
    Should Be Equal As Strings      ${RESPONSE.status_code}      ${STATUS_CODE}

the response is valid
    Log     ${RESPONSE.json()}
    Validate Json    weather.schema.json  ${RESPONSE.json()}

the city name is "${CITY}"
    Should Be Equal As Strings      ${RESPONSE.json()["name"]}      ${CITY}

search the weather by the city id "${ID}"
    Create Session  openWeatherApi      ${API_URL}
    &{PARAMS}       Create Dictionary   id=${ID}       APPID=${API_KEY}
    ${RESPONSE}     GET On Session      openWeatherApi  /weather    params=${PARAMS}    expected_status=any
    Set Test Variable   ${RESPONSE}

search the weather by the latitude "${LAT}" and longitude "${LON}"
    Create Session  openWeatherApi      ${API_URL}
    &{PARAMS}       Create Dictionary   lat=${LAT}      lon=${LON}  APPID=${API_KEY}
    ${RESPONSE}     GET On Session      openWeatherApi  /weather    params=${PARAMS}    expected_status=any
    Set Test Variable   ${RESPONSE}

search the weather by the zip code "${ZIP}"
    Create Session  openWeatherApi      ${API_URL}
    &{PARAMS}       Create Dictionary   zip=${ZIP}       APPID=${API_KEY}
    ${RESPONSE}     GET On Session      openWeatherApi  /weather    params=${PARAMS}    expected_status=any
    Set Test Variable   ${RESPONSE}

search the weather on "${QUERY}" using a invalid api key
    Create Session  openWeatherApi      ${API_URL}
    &{PARAMS}       Create Dictionary   q=${QUERY}       APPID=INVALID_KEY
    ${RESPONSE}     GET On Session      openWeatherApi  /weather    params=${PARAMS}    expected_status=any
    Set Test Variable   ${RESPONSE}

the message error is "${ERROR_MSG}"
    Log     ${RESPONSE.json()}
    Should Be Equal As Strings      ${RESPONSE.json()["message"]}      ${ERROR_MSG}
