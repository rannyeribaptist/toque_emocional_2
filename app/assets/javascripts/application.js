// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require jquery
//= require jquery-ui
//= require filterrific/filterrific-jquery
//= require cocoon
//= require jquery-ui/widgets/autocomplete
//= require autocomplete-rails
//= require jquery.mask
//= require_tree .

jQuery.railsAutocomplete.options.noMatchesLabel = 'Nada encontrado, preencha os campos para que o que você procura seja automaticamente registrado no nosso banco de dados'

function fields() {
  let fields = $('.nested-fields').last();
  let name = fields.children().first().children().last();
  let number = name.attr('id');

  number = number.replace('occurrency_occurrency_students_attributes_', '').replace('_name', '');
  name.attr('data-update-elements', '{"classy":"#occurrency_occurrency_students_attributes_' + number + '_classy","groupy":"#occurrency_occurrency_students_attributes_' + number + '_groupy","id":"#occurrency_occurrency_students_attributes_' + number + '_student_id"}');
}

$(document).ready(function(){
  $(".date").mask("00/00/0000");
});
