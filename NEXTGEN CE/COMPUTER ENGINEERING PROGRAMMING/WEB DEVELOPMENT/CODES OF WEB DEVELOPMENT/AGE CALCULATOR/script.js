function calculateAge() {
    const day=parseInt(document.getElementById('day').value);
    const month=parseInt(document.getElementById('month').value);
    const year=parseInt(document.getElementById('year').value);
    const errorDiv=document.getElementById('error');
    const resultDiv=document.getElementById('result');
    //Input Validation
    if(isNaN(day) || isNaN(month) || isNaN(year)){
        errorDiv.innerHTML="Please enter valid numberic values.";
        return;
    }
    const birthDate=new Date(year,month-1,day);
    const today=new Date();
    if(birthDate>today){
        errorDiv.innerHTML="Birth date cannot be in the future.";
        return;
    }
    let years=today.getFullYear()-birthDate.getFullYear();
    let months=today.getMonth()-birthDate.getMonth();
    let days=today.getDate()-birthDate.getDate();
    if(days<0){
        months--;
        const lastMonth=new Date(today.getFullYear(),today.getMonth(),0);
        days+=lastMonth.getDate();
    }
    if(months<0){
        years--;
        months+=12;
    }
    errorDiv.innerHTML="";
    resultDiv.innerHTML="Your Age is: "+years+" Years, "+months+" Months, "+days+" Days.";
}