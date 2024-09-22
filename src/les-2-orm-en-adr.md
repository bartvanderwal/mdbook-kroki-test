# Les 2 - ORM (EF core)

<kroki type="erd">
  [Student]
  *Naam
  +Student nummer

[CDMMSelfAssessment]
Datum
Student
CDMMCheckPoint

[CDMMEvaluation]
CDMMCheckpoint
IsChecked
Argumentatie

[CDMMCheckPoint]
CDMMCategorie
CDMMNiveau
Code
Titel
Beschrijving

[CDMMCategorie]
Id
Beschrijving

[CDMMNiveau]
Id
Beschrijving

Student 1--* CDMMSelfAssessment
CDMMSelfAssessment 1--* CDMMEvaluation
CDMMEvaluation 1--1 CDMMCheckpoint
CDMMCheckpoint 1--5 CDMMCategorie
CDMMCheckpoint 1--5 CDMMNiveau

</kroki>
