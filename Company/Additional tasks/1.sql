ALTER TABLE Salary
ADD CHECK (0 < Month AND Month < 13 AND 2002 < Year AND Year < 2016)