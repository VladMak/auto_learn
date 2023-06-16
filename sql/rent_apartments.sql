create database apartments;
create role "service.apartmens" with superuser login password 'qwerty';

CREATE TABLE users (
  user_id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL,
  password VARCHAR(255) NOT NULL,
  phone_number VARCHAR(20) NOT NULL
);

CREATE TABLE countries (
  country_id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL
);

CREATE TABLE cities (
  city_id SERIAL PRIMARY KEY,
  country_id INTEGER NOT NULL,
  name VARCHAR(255) NOT NULL,
  FOREIGN KEY (country_id) REFERENCES countries(country_id) ON DELETE CASCADE
);

CREATE TABLE addresses (
  address_id SERIAL PRIMARY KEY,
  city_id INTEGER NOT NULL,
  street VARCHAR(255) NOT NULL,
  house_number VARCHAR(10) NOT NULL,
  apartment_number VARCHAR(10),
  FOREIGN KEY (city_id) REFERENCES cities(city_id) ON DELETE CASCADE
);

CREATE TABLE apartment_types (
  type_id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  description TEXT
);

CREATE TABLE apartments (
  apartment_id SERIAL PRIMARY KEY,
  address_id INTEGER NOT NULL,
  type_id INTEGER NOT NULL,
  price NUMERIC(10,2) NOT NULL,
  size INTEGER NOT NULL,
  description TEXT,
  FOREIGN KEY (address_id) REFERENCES addresses(address_id) ON DELETE CASCADE,
  FOREIGN KEY (type_id) REFERENCES apartment_types(type_id)
);

CREATE TABLE orders (
  order_id SERIAL PRIMARY KEY,
  user_id INTEGER NOT NULL,
  apartment_id INTEGER NOT NULL,
  start_date DATE NOT NULL,
  end_date DATE NOT NULL,
  status VARCHAR(50) NOT NULL,
  FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE,
  FOREIGN KEY (apartment_id) REFERENCES apartments(apartment_id) ON DELETE CASCADE
);