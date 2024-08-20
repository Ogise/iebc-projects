// Constituencies data mapped to counties
const constituencyData = {
  "Nairobi": ["Kasarani", "Embakasi East", "Embakasi West", "Starehe", "Lang'ata"],
  "Mombasa": ["Kisauni", "Changamwe", "Nyali", "Likoni", "Mvita"],
  "Kisumu": ["Kisumu Central", "Kisumu East", "Kisumu West", "Seme", "Nyando"],
  "Nakuru": ["Nakuru Town East", "Nakuru Town West", "Nakuru East", "Nakuru West", "Rongai"],
  "Eldoret": ["Kapseret", "Ainabkoi", "Kesses", "Soy", "Turbo"]
};

// Populate constituencies dropdown with selected county's constituencies
function showConstituencies() {
  var countySelect = document.getElementById("counties");
  var selectedCounty = countySelect.options[countySelect.selectedIndex].value;
  var constituencySelect = document.getElementById("constituencies");
  constituencySelect.innerHTML = "<option value=''>Select Constituency</option>";

  if (selectedCounty !== "") {
    constituencyData[selectedCounty].forEach(function(constituency) {
      var option = document.createElement("option");
      option.text = constituency;
      option.value = constituency;
      constituencySelect.add(option);
    });
  }
}

// Show county based on selected constituency
function showCounty() {
  var constituencySelect = document.getElementById("constituencies");
  var selectedConstituency = constituencySelect.options[constituencySelect.selectedIndex].value;
  var countySelect = document.getElementById("counties");

  for (const [county, constituencies] of Object.entries(constituencyData)) {
    if (constituencies.includes(selectedConstituency)) {
      countySelect.value = county;
      break;
    }
  }
}


