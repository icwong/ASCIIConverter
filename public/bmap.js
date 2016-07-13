  var map = null;
  var searchManager = null;

  function getMap()
  {
    map = new Microsoft.Maps.Map(document.getElementById('myMap'), {credentials: 'AkncMOPhJUoGDu9stqfQxrQisQXAmlDYdEMrfVHr5eOwv5-QKONY7tAA1IxJjJGK'});
  }
  
  function createSearchManager() 
  {
      map.addComponent('searchManager', new Microsoft.Maps.Search.SearchManager(map)); 
      searchManager = map.getComponent('searchManager'); 
  }
  
  function LoadSearchModule()
  {
  	var location = document.getElementById('location');
    Microsoft.Maps.loadModule(location.value, { callback: geocodeRequest })
  }
  
  function geocodeRequest() 
  { 
    createSearchManager(); 
    var where = 'SFU'; 
    var userData = { name: 'Maps Test User', id: 'XYZ' }; 
    var request = 
    { 
        where: where, 
        count: 5, 
        bounds: map.getBounds(), 
        callback: onGeocodeSuccess, 
        errorCallback: onGeocodeFailed, 
        userData: userData 
    }; 
    searchManager.geocode(request); 
  } 
  
  function onGeocodeSuccess(result, userData) 
  { 
    if (result) { 
        map.entities.clear(); 
        var topResult = result.results && result.results[0]; 
        if (topResult) { 
            var pushpin = new Microsoft.Maps.Pushpin(topResult.location, null); 
            map.setView({ center: topResult.location, zoom: 10 }); 
            map.entities.push(pushpin); 
        } 
    } 
  } 
  
  function onGeocodeFailed(result, userData) { 
    alert('Geocode failed'); 
  } 
