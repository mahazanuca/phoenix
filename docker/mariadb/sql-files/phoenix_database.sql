USE phoenix_api;
CREATE TABLE Users (
	    id INT AUTO_INCREMENT PRIMARY KEY,
	    name VARCHAR(50) NOT NULL,
	    email VARCHAR(50) NOT NULL,
	    password VARCHAR(32) NOT NULL,
	    verified BOOLEAN NOT NULL DEFAULT 0,
	    phone VARCHAR(20) NOT NULL,
	    city INTEGER references(Cities), 
	    address varchar(255)
);
