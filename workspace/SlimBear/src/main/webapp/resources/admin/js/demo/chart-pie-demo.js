// Set new default font family and font color to mimic Bootstrap's default styling
Chart.defaults.global.defaultFontFamily = 'Nunito', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = '#858796';


// 매출 비율 차트
var ctx = document.getElementById("salesLatio");
var myPieChart = new Chart(ctx, {
  type: 'doughnut',
  data: {
    labels: ["탑", "아우터", "바텀", "언더웨어", "스포츠"],
    datasets: [{
    
      //탑, 아우터, 바텀... 순서대로 값 넣으면됨
      data: [40000, 25000, 150000, 10000, 100000],
      backgroundColor: ['#4e73df', '#1cc88a', '#36b9cc', '#f6c23e', '#e74a3b'],
      hoverBackgroundColor: ['#2e59d9', '#17a673', '#2c9faf'],
      hoverBorderColor: "rgba(234, 236, 244, 1)",
    }],
  },
  options: {
    maintainAspectRatio: false,
    tooltips: {
      backgroundColor: "rgb(255,255,255)",
      bodyFontColor: "#858796",
      borderColor: '#dddfeb',
      borderWidth: 1,
      xPadding: 15,
      yPadding: 15,
      displayColors: false,
      caretPadding: 10,
    },
    legend: {
      display: false
    },
    cutoutPercentage: 80,
  },
});


//연령대 회원수 차트
var ctx = document.getElementById("ageCus");
var myPieChart = new Chart(ctx, {
  type: 'doughnut',
  data: {
    labels: ["10대", "20대", "30대", "40대", "50대", "60대 이상"],
    datasets: [{
    
      // 10대20대 30대... 순서대로 값 넣으면됨
      data: [7, 6, 5, 4, 3, 1],
      backgroundColor: ['#4e73df', '#1cc88a', '#36b9cc', '#f6c23e', '#e74a3b', '#858796'],
      hoverBackgroundColor: ['#2e59d9', '#e74a3b', '#2c9faf'],
      hoverBorderColor: "rgba(234, 236, 244, 1)",
    }],
  },
  options: {
    maintainAspectRatio: false,
    tooltips: {
      backgroundColor: "rgb(255,255,255)",
      bodyFontColor: "#858796",
      borderColor: '#dddfeb',
      borderWidth: 1,
      xPadding: 15,
      yPadding: 15,
      displayColors: false,
      caretPadding: 10,
    },
    legend: {
      display: false
    },
    cutoutPercentage: 80,
  },
});


//10대 선호도 차트
var ctx = document.getElementById("age10");
var myPieChart = new Chart(ctx, {
  type: 'doughnut',
  data: {
    labels: ["탑", "아우터", "바텀", "언더웨어", "스포츠"],
    datasets: [{
    
      //순서대로 탑, 아우터, 바텀, 언더웨어, 스포츠 의 값 넣으면됨
      data: [1, 3, 2, 5, 7],
      backgroundColor: ['#4e73df', '#1cc88a', '#36b9cc', '#f6c23e', '#e74a3b'],
      hoverBackgroundColor: ['#2e59d9', '#17a673', '#2c9faf'],
      hoverBorderColor: "rgba(234, 236, 244, 1)",
    }],
  },
  options: {
    maintainAspectRatio: false,
    tooltips: {
      backgroundColor: "rgb(255,255,255)",
      bodyFontColor: "#858796",
      borderColor: '#dddfeb',
      borderWidth: 1,
      xPadding: 15,
      yPadding: 15,
      displayColors: false,
      caretPadding: 10,
    },
    legend: {
      display: false
    },
    cutoutPercentage: 80,
  },
});


//20대 선호도 차트
var ctx = document.getElementById("age20");
var myPieChart = new Chart(ctx, {
  type: 'doughnut',
  data: {
    labels: ["탑", "아우터", "바텀", "언더웨어", "스포츠"],
    datasets: [{
    
      //순서대로 탑, 아우터, 바텀, 언더웨어, 스포츠 의 값 넣으면됨
      data: [4, 7, 9, 2, 5],
      backgroundColor: ['#4e73df', '#1cc88a', '#36b9cc', '#f6c23e', '#e74a3b'],
      hoverBackgroundColor: ['#2e59d9', '#17a673', '#2c9faf'],
      hoverBorderColor: "rgba(234, 236, 244, 1)",
    }],
  },
  options: {
    maintainAspectRatio: false,
    tooltips: {
      backgroundColor: "rgb(255,255,255)",
      bodyFontColor: "#858796",
      borderColor: '#dddfeb',
      borderWidth: 1,
      xPadding: 15,
      yPadding: 15,
      displayColors: false,
      caretPadding: 10,
    },
    legend: {
      display: false
    },
    cutoutPercentage: 80,
  },
});


//30대 선호도 차트
var ctx = document.getElementById("age30");
var myPieChart = new Chart(ctx, {
  type: 'doughnut',
  data: {
    labels: ["탑", "아우터", "바텀", "언더웨어", "스포츠"],
    datasets: [{
      //순서대로 탑, 아우터, 바텀, 언더웨어, 스포츠 의 값 넣으면됨
      data: [1, 2, 3, 4, 5],
      backgroundColor: ['#4e73df', '#1cc88a', '#36b9cc', '#f6c23e', '#e74a3b'],
      hoverBackgroundColor: ['#2e59d9', '#17a673', '#2c9faf'],
      hoverBorderColor: "rgba(234, 236, 244, 1)",
    }],
  },
  options: {
    maintainAspectRatio: false,
    tooltips: {
      backgroundColor: "rgb(255,255,255)",
      bodyFontColor: "#858796",
      borderColor: '#dddfeb',
      borderWidth: 1,
      xPadding: 15,
      yPadding: 15,
      displayColors: false,
      caretPadding: 10,
    },
    legend: {
      display: false
    },
    cutoutPercentage: 80,
  },
});


//40대 선호도 차트
var ctx = document.getElementById("age40");
var myPieChart = new Chart(ctx, {
  type: 'doughnut',
  data: {
    labels: ["탑", "아우터", "바텀", "언더웨어", "스포츠"],
    datasets: [{
    
      //순서대로 탑, 아우터, 바텀, 언더웨어, 스포츠 의 값 넣으면됨
      data: [40000, 25000, 150000, 10000, 100000],
      backgroundColor: ['#4e73df', '#1cc88a', '#36b9cc', '#f6c23e', '#e74a3b'],
      hoverBackgroundColor: ['#2e59d9', '#17a673', '#2c9faf'],
      hoverBorderColor: "rgba(234, 236, 244, 1)",
    }],
  },
  options: {
    maintainAspectRatio: false,
    tooltips: {
      backgroundColor: "rgb(255,255,255)",
      bodyFontColor: "#858796",
      borderColor: '#dddfeb',
      borderWidth: 1,
      xPadding: 15,
      yPadding: 15,
      displayColors: false,
      caretPadding: 10,
    },
    legend: {
      display: false
    },
    cutoutPercentage: 80,
  },
});


//50대 선호도 차트
var ctx = document.getElementById("age50");
var myPieChart = new Chart(ctx, {
  type: 'doughnut',
  data: {
    labels: ["탑", "아우터", "바텀", "언더웨어", "스포츠"],
    datasets: [{
    
      //순서대로 탑, 아우터, 바텀, 언더웨어, 스포츠 의 값 넣으면됨
      data: [9, 7, 5, 3, 1],
      backgroundColor: ['#4e73df', '#1cc88a', '#36b9cc', '#f6c23e', '#e74a3b'],
      hoverBackgroundColor: ['#2e59d9', '#17a673', '#2c9faf'],
      hoverBorderColor: "rgba(234, 236, 244, 1)",
    }],
  },
  options: {
    maintainAspectRatio: false,
    tooltips: {
      backgroundColor: "rgb(255,255,255)",
      bodyFontColor: "#858796",
      borderColor: '#dddfeb',
      borderWidth: 1,
      xPadding: 15,
      yPadding: 15,
      displayColors: false,
      caretPadding: 10,
    },
    legend: {
      display: false
    },
    cutoutPercentage: 80,
  },
});


//60대 이상 선호도 차트
var ctx = document.getElementById("age60high");
var myPieChart = new Chart(ctx, {
  type: 'doughnut',
  data: {
    labels: ["탑", "아우터", "바텀", "언더웨어", "스포츠"],
    datasets: [{
    
      //순서대로 탑, 아우터, 바텀, 언더웨어, 스포츠 의 값 넣으면됨
      data: [52, 13, 24, 35, 71],
      backgroundColor: ['#4e73df', '#1cc88a', '#36b9cc', '#f6c23e', '#e74a3b'],
      hoverBackgroundColor: ['#2e59d9', '#17a673', '#2c9faf'],
      hoverBorderColor: "rgba(234, 236, 244, 1)",
    }],
  },
  options: {
    maintainAspectRatio: false,
    tooltips: {
      backgroundColor: "rgb(255,255,255)",
      bodyFontColor: "#858796",
      borderColor: '#dddfeb',
      borderWidth: 1,
      xPadding: 15,
      yPadding: 15,
      displayColors: false,
      caretPadding: 10,
    },
    legend: {
      display: false
    },
    cutoutPercentage: 80,
  },
});