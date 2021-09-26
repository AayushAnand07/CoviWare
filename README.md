
# CoviWare

A Flutter Application for general awareness over Covid-19 with 
some special features integrated withina and bringing whole bunch of awareness related to
this disease under one roof.



## Features

- Covid general awareness through FAQ pages and linked WHO sites
- Vaccine slot search through pincode and date
- News section for health updates around the world
- Covid World report with dynamic data and Comparison with India.


  
## Installation

To install this project run

```bash
  git clone 
   ```

Open flie in  your code editor 
```bash
  Flutter run
   ```
 Get the dependencies
 
  
# Screenshots and Demo video
## Main Home Screen
 
![App Screenshot](https://user-images.githubusercontent.com/41218074/134806059-0b463141-c5c6-49af-bba4-a2dd353c96a2.png)
##
### Demo video of Main Home Page
https://user-images.githubusercontent.com/41218074/134806229-1712e05c-9376-44a0-bd6b-6e26a425db09.mp4
##
## Slot Booking Screen
 
![App Screenshot](https://user-images.githubusercontent.com/41218074/134806888-167b406e-1be8-4cfd-b9c0-7172b6f6102d.jpg)
##
### Demo video of Slot Booking Page
https://user-images.githubusercontent.com/41218074/134806229-1712e05c-9376-44a0-bd6b-6e26a425db09.mp4

##
## Health News update Screen
 
![App Screenshot](https://user-images.githubusercontent.com/41218074/134807091-963f78b8-0bec-432a-9368-6283a73a9cb9.jpg)
##
### Demo of News Page
https://user-images.githubusercontent.com/41218074/134807123-abff1c65-6b6d-49f0-9dd6-b99337fa323c.mp4

##
## Covid-19 World Report Screen
 
![App Screenshot](https://user-images.githubusercontent.com/41218074/134807407-eefa68d3-78a1-450f-9d16-2b3c88b18bfc.jpg)
##
### Search Your Country Screen
![App Screenshot](https://user-images.githubusercontent.com/41218074/134807505-c34c262f-dc73-4bb8-aa9b-c4808872fa0b.jpg)

##
### Covid-19 World Report Page Demo
https://user-images.githubusercontent.com/41218074/134807578-b7be4a29-fb4f-4445-9086-36d10a063419.mp4

## API Reference

#### Get vaccine slot details based on Pincode and date




```http
  GET  https://cdn-api.co-vin.in/api/v2/appointment/sessions/public/findByPin?pincode=826001&date=27%2F9%2F2021
```

| Parameter | Type     | Description                       |
| :-------- | :------- | :-------------------------------- |
| `pincode`      | `int` | **Required**.  |
| `Date`      | `int` | **Required**. |

 
 #### Get Covid status of the world 

```http
  GET  https://corona.lmao.ninja/v2/all
```

#### Get Covid status of the countries sorted based on cases 

```http
  GET  https://corona.lmao.ninja/v2/countries?sort=cases
```



#### Get health updates regarding india 

```http
  GET https://newsapi.org/v2/top-headlines?country=in&category=health&apiKey={Your api key}
```

| Parameter | Type     | Description                       |
| :-------- | :------- | :-------------------------------- |
| `country`      | `string` | **Required**.  |
| `category`      | `string` | **Required**. |
| `api key`      | `string` | **Required**. |


  
## Author

- [AayushAnand](https://github.com/AayushAnand07)

  