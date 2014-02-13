'use strict';
var util    = require('util');
var path    = require('path');
var _s      = require('underscore.string');
var yeoman  = require('yeoman-generator');
var chalk   = require('chalk');


var ComponentGenerator = yeoman.generators.Base.extend({
  init: function (args, options, config) {
    if(args !== undefined){
      this.componentName = args;
    }

    this.pkg = yeoman.file.readJSON(path.join(__dirname, '../package.json'));

    this.on('end', function () {
      
      // Do some things

    });
  },

  askFor: function () {
    var done = this.async();

    // have Yeoman greet the user
    console.log(this.yeoman);

    var prompts = [
      {
        name: 'componentsLocation',
        message: 'Where should this component be stored?',
        default: "./src/components" // TODO: Make this more modular. eg. read from config somewhere.
      },
      {
        type: 'confirm',
        name: 'includeView',
        message: 'Should I include a default view for this Component?',
        default: true
      }];
    
    // Add some extra questions
    if(!this.componentName){
      prompts.unshift({
        name: 'componentName',
        message: 'What should I name this component?'
      });
    }

    // Process answers
    this.prompt(prompts, function (props) {
      this.componentsLocation = props.componentsLocation;
      this.shouldIncludeView  = props.includeView;
      
      if(props.componentName){
        this.componentName = props.componentName;
      }

      done();
    }.bind(this));
  },

  componentNameLower: function(){
    return this.componentName.toLowerCase();
  },

  componentRoot: function(){
    return this.componentsLocation + '/' + this.componentNameLower();
  },

  componentNamespace: function(){
    var parts = this.componentRoot().split('/');
    parts.shift()
    parts.shift()
    return parts.join('/');
  },

  componentNameCapitalized: function(){
    return _s.capitalize(this.componentName);
  },

  componentNameCamelCased: function(){
    return this.componentNameCapitalized().replace(/(\_[a-z])/g, function($1) { 
      return $1.toUpperCase().replace('_','');
    });
  },

  componentNameLowerCamelCased: function(){
    return this.componentNameLower().replace(/(\_[a-z])/g, function($1) { 
      return $1.toUpperCase().replace('_','');
    });
  },

  app: function () {
    this.mkdir(this.componentRoot());
    this.template('component/module.coffee',  this.componentRoot() + '/module.coffee');
    this.template('component/component.json', this.componentRoot() + '/component.json');

    // Should we include a default view?
    if(this.shouldIncludeView){
      this.mkdir(this.componentRoot() + '/assets');
      this.template('component/controller_with_view.coffee', this.componentRoot() + '/controller.coffee');
      this.template('component/assets/view.coffee',          this.componentRoot() + '/assets/' + this.componentNameLower() + '.coffee');
      this.template('component/assets/template.jade',        this.componentRoot() + '/assets/' + this.componentNameLower() + '.jade');
    }
    else{
      this.template('component/controller.coffee', this.componentRoot() + '/controller.coffee');
    }
  },

  projectfiles: function () {
    // This method doesnt do anything..
  }
});

module.exports = ComponentGenerator;