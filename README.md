# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

API END POINTS
1. Device Create api

  POST => http://localhost:3000/api/v1/devices

  {
    "device": {
      "mac_id":"a343hasdjsadjsd",
          "name": "Device1",
          "ip": "127.0.0.1",
          "training_status": "start"
    }
  }

2. Session image upload api

  POST => http://localhost:3000/api/v1/sessions/upload_image

  {
    "session": {
       "session_id": 4,
       "image": "data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAkGBxMSEhUSExIVFRUWGBcXFxgXFxUYFxUWGBUYGBcVGBcYHSggGBolGxgVITEhJSkrLi4uFyA1ODMtNygtLisBCgoKDg0OGhAQGi8lICMtMC0tLi0tLS8tKy0tLS0tLS0vLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLf....."
    }
  }# BlobImageStore
# BlobImageStore
