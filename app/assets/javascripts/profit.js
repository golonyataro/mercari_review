$(function(){
  function profitbuildHTML(profit){
    var html = `
    <div id = "add-profit">
      ¥${profit}
    </div>
    `
    return html;
  }
  function feebuildHTML(fee){
    var html = `
    <div id = "add-fee">
      ¥${fee}
    </div>
    `
    return html;
  }

  $('#price-form').on('keypress',function(){
    $('#add-profit').remove()
    var priceForm = document.getElementById("price-form").value;
    var fee = priceForm
    var html = profitbuildHTML(fee)
    $('#fee').append(html)
  })

  $('#price-form').on('keypress',function(){
    $('#add-fee').remove()
    var priceForm = document.getElementById("price-form").value;
    var profit = priceForm * 9
    var html = feebuildHTML(profit)
    $('#profit').append(html)
  })
})