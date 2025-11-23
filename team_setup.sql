CREATE TABLE app_user (
    id SERIAL PRIMARY KEY,
    username TEXT UNIQUE NOT NULL,
    password_hash TEXT NOT NULL,
    role TEXT NOT NULL CHECK (role IN ('admin','viewer'))
);

/*one default user to be able to login to the app initially*/
INSERT INTO app_user (username, password_hash, role)
VALUES (
    'admin',
    -- password is: admin123
    'scrypt:32768:8:1$eqiDWt4GehltibPL$c5bbc6f3a3d1f650848296e13ddd00949af03ef8fc587275406b0c4ebea65c61b1100c2159afdd1c9075b3129815214c878a905c972904637e2a007439b0c632',
    'admin'
);

INSERT INTO app_user (username, password_hash, role)
VALUES (
    'viewer1',
    'scrypt:32768:8:1$3qGXS69FsEu4zAjC$f76d3be3aa6a6c148aae01a1bb56afbb18c53c646bb52a846c5ec5fb1c264e9ca5124b86acf3b426c47355f2ef68fc3e2bbee0a17bc08ca8ee00dd766f2af70c',
    'viewer'
);

/*I inserted also a viewer user with the following credentials
username: viewer1
password: viewer123
*/

CREATE INDEX IF NOT EXISTS idx_employee_name 
    ON Employee (Lname, Fname);

CREATE INDEX IF NOT EXISTS idx_workson_pno 
    ON Works_On (Pno);




