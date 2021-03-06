# Diet Calc

Diet Calc is a calculator for clinical dietitians. 

Diet Calc is NOT simply a BMI calculator (although, it was inspired by [The App Brewery's BMI Calculator](https://github.com/londonappbrewery/bmi-calculator-flutter) and the beautiful design of [Ruben Vaalt](https://dribbble.com/shots/4585382-Simple-BMI-Calculator)). It performs nutritional calculations to help clinicians assess the needs of their patients and incorporates intuitive input fields to enhance user experience. As a mobile Flutter app, Diet Calc can be used on both Android and iOS, allowing dietitians easy access to estimated needs wherever they are. 

Focus on making clinical judgments - let Diet Calc do the math. 

# Demo
<div align="center">
<table>
  <tr align="center">
    <td>Input Page</td>
     <td>Results Page</td>
  </tr>
  <tr>
    <td><img src="https://media.giphy.com/media/K9RIAsnd27pelZUfTX/giphy.gif" alt="Input Page"/></td>
    <td><img src="https://user-images.githubusercontent.com/73001148/127092221-a3193bd5-d843-43f1-9cee-f08185187878.jpg" alt="Results Page" width="235" height="480"/></td>
  </tr>
 </table>
  </div>

# Instructions

Users can calculate caloric needs the quick, simplified way or by using the built-in, evidenced-based Mifflin St. Jeor equation. 

For the simplified method, only height and weight are required. Utilize the other inputs (gender, age, and activity/stress factor) to see the results of Mifflin St. Jeor. 

Gender can be selected or deselected with just a touch. 

Pressing on the age, height, and weight cards will bring up the number pad. 

Users can toggle between cm/in and kgs/lbs to instantly convert from metric to standard or from standard to metric units. Similarly, users can toggle between activity factor or stress factor and use the slider to select the appropriate metabolic multiplier. 

Pressing the 'CALCULATE' button will bring the user to the results page, where BMI, MSJ/Simplified Caloric, Protein, and Fluid needs are displayed, as well as helpful ranges based on common clinical conditions. 


# Future Implementations

- Validations to check for required inputs
- Calorie counts, including nutritional supplementation and super foods
- Tube feeding and total parenteral nutrition formulation calculations
- User logins and authorization
- Back-end to store patient data
