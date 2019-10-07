/* Welcome to the SQL mini project. For this project, you will use
Springboard' online SQL platform, which you can log into through the
following link:

https://sql.springboard.com/
Username: student
Password: learn_sql@springboard

The data you need is in the "country_club" database. This database
contains 3 tables:
    i) the "Bookings" table,
    ii) the "Facilities" table, and
    iii) the "Members" table.

Note that, if you need to, you can also download these tables locally.

In the mini project, you'll be asked a series of questions. You can
solve them using the platform, but for the final deliverable,
paste the code for each solution into this script, and upload it
to your GitHub.

Before starting with the questions, feel free to take your time,
exploring the data, and getting acquainted with the 3 tables. */



/* Q1: Some of the facilities charge a fee to members, but some do not.
Please list the names of the facilities that do. */

ANS) SELECT name
     FROM Facilities
     Where membercost >0


/* Q2: How many facilities do not charge a fee to members? */

ANS)  SELECT count(*)
      From Members
      Where membercost = 0
      


/* Q3: How can you produce a list of facilities that charge a fee to members,
where the fee is less than 20% of the facility's monthly maintenance cost?
Return the facid, facility name, member cost, and monthly maintenance of the
facilities in question. */

ANS)  SELECT facid,name,membercost,monthlymaintenance
      From Facilities
      Where membercost < (monthlymaintenance * 0.2)


/* Q4: How can you retrieve the details of facilities with ID 1 and 5?
Write the query without using the OR operator. */

ANS)    SELECT *
        FROM Facilities 
        Where facid in (1,5)


/* Q5: How can you produce a list of facilities, with each labelled as
'cheap' or 'expensive', depending on if their monthly maintenance cost is
more than $100? Return the name and monthly maintenance of the facilities
in question. */

ANS)   Select name,monthlymaintenance
       CASE When (monthlymaintenance > 100) THEN 'expensive'
            Else 'cheap'
            End as category
       From Facilities


/* Q6: You'd like to get the first and last name of the last member(s)
who signed up. Do not use the LIMIT clause for your solution. */

ANS)    Select surname,firstname,max(joindate) as date
        From Members


/* Q7: How can you produce a list of all members who have used a tennis court?
Include in your output the name of the court, and the name of the member
formatted as a single column. Ensure no duplicate data, and order by
the member name. */

ANS)      SELECT concat(firstname, ' ', surname, ' ', name) 
          FROM Facilities 
          JOIN Bookings  
          ON Facilities.facid = Bookings.facid 
          JOIN Members c 
          ON Bookings.memid=Members.memid 
          WHERE name IN ("Tennis Court 1", "Tennis Court 2")
          GROUP BY 1
          ORDER BY 1

