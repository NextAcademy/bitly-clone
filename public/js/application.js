$('document').ready(function() {

  $('#request_form').submit(function(event) {

    var random = $('#request_form').serialize()

    $.ajax({
      url: '/shorten_url',
      method: 'POST',
      data: random,
      success: function(data) {
        if (data === 'Not a valid URL') {
          alert(data)
          update = document.getElementById('show-me-the-money')
          update.innerHTML = data
        } else {
        	alert('Your new link has been added')
        	var update = document.getElementById('show-me-the-money')
        	update.innerHTML = 'Your new link is http://localhost:9393/' + JSON.parse(data).short_url
        	 }
      }
    })
    event.preventDefault()
  })

  historyTable()

  $('#button-column').on('click', '#hide_history_table_button', function(event) {
    removeHideHistoryButton()
    makeHistoryButton()
    $('#history-table').empty()
    $('#history-table').removeClass('effects')
  })

})



function historyTable () {
  $('#button-column').on('click', '#history_table_button', function(event){
    $.ajax({
      url: '/list_url',
      method: 'POST',
      success: function(data){
        not_a_string = JSON.parse(data)
        target = document.getElementById('history-table')
        headerForTable = makeBigCheeseHeader()
        target.appendChild(headerForTable)
        $.each(not_a_string, function(index, value){
          target.appendChild(assembleHistoryTableRow(value))
        })
        removeHistoryButton()
        makeHideHistoryButton()
        target.setAttribute('class', 'effects')
      }
    })
    event.preventDefault()
  })
}

function assembleHistoryTableRow (data) {
  bigCheese = makeBigCheese()
  firstColumn = makeFirstColumn(data)
  secondColumn = makeSecondColumn(data)
  thirdColumn = makeThirdColumn(data)
  bigCheese.appendChild(firstColumn)
  bigCheese.appendChild(secondColumn)
  bigCheese.appendChild(thirdColumn)
  return bigCheese
}

function makeBigCheeseHeader() {
  rowContainer = document.createElement('div')
  rowContainer.className = 'row history-table-head-location'
  rowContainer.setAttribute('style', 'background-image: url(\'/img/landscape-mountains-nature-clouds.jpg\'); background-size: cover; border-bottom: 2px solid black; width:100%; margin: auto' )
  firstColumn = document.createElement('div')
  firstColumn.className = 'col-md-4'
  firstColumnTitle = document.createElement('h4')
  firstColumnTitle.className = 'text-center table-header'
  firstColumnTitle.innerHTML = 'Original URL'
  secondColumn = document.createElement('div')
  secondColumn.className = 'col-md-4'
  secondColumnTitle = document.createElement('h4')
  secondColumnTitle.className = 'text-center table-header'
  secondColumnTitle.innerHTML = 'Shortened URL'
  thirdColumn = document.createElement('div')
  thirdColumn.className = 'col-md-4'
  thirdColumnTitle = document.createElement('h4')
  thirdColumnTitle.className = 'text-center table-header'
  thirdColumnTitle.innerHTML = 'Counter'
  firstColumn.appendChild(firstColumnTitle)
  rowContainer.appendChild(firstColumn)
  secondColumn.appendChild(secondColumnTitle)
  rowContainer.appendChild(secondColumn)
  thirdColumn.appendChild(thirdColumnTitle)
  rowContainer.appendChild(thirdColumn)
  return rowContainer
}


function makeBigCheese () {
  bigCheese = document.createElement('div')
  bigCheese.id = 'history-table-row-location'
  bigCheese.className = 'row'
  return bigCheese
}

function makeFirstColumn (data) {
  firstElement = document.createElement('div')
  firstElement.className = 'col-md-4'
  secondElement = document.createElement('p')
  secondElement.className = 'text-center table-meat'
  secondElement.innerHTML = data.long_url
  firstElement.appendChild(secondElement)
  return firstElement
}

function makeSecondColumn (data) {
  firstElement = document.createElement('div')
  firstElement.className = 'col-md-4'
  secondElement = document.createElement('a')
  secondElement.setAttribute('href','http://localhost:9393/' + data.short_url)
  thirdElement = document.createElement('p')
  thirdElement.className = 'text-center table-meat'
  thirdElement.innerHTML = 'http://localhost:9393:/' + data.short_url
  secondElement.appendChild(thirdElement)
  firstElement.appendChild(secondElement)
  return firstElement
}

function makeThirdColumn (data) {
  firstElement = document.createElement('div')
  firstElement.className = 'col-md-4'
  secondElement = document.createElement('p')
  secondElement.className = 'text-center table-meat'
  secondElement.innerHTML = data.counter
  firstElement.appendChild(secondElement)
  return firstElement
}

function removeHistoryButton () {
  buttonContainer = document.getElementById('button-column')
  button = document.getElementById('history_table_button')
  buttonContainer.removeChild(button)
}

function makeHideHistoryButton() {
  buttonContainer = document.getElementById('button-column')
  newButton = document.createElement('button')
  newButton.setAttribute('style','border: black 2px solid')
  newButton.className = 'btn btn-block'
  newButton.id = 'hide_history_table_button'
  newButton.innerHTML = 'Hide History'
  buttonContainer.appendChild(newButton)
}

function makeHistoryButton () {
  buttonContainer = document.getElementById('button-column')
  newButton = document.createElement('button')
  newButton.setAttribute('style','border: black 2px solid')
  newButton.className = 'btn btn-block'
  newButton.id = 'history_table_button'
  newButton.innerHTML = 'Show History'
  buttonContainer.appendChild(newButton)
}

function removeHideHistoryButton () {
 buttonContainer = document.getElementById('button-column')
 button = document.getElementById('hide_history_table_button')
 buttonContainer.removeChild(button)
}