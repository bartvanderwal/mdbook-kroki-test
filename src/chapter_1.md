# Chapter 1

<kroki type="erd">
  [Person]
  *name
  height
  weight
  +birth_location_id

  [Location]
  *id
  city
  state
  country

  Person *--1 Location
</kroki>
