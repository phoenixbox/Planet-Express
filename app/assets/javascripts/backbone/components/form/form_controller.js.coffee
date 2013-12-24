@PlanetExpress.module "Components.Form", (Form, App, Backbone, Marionette, $, _) ->

	class Form.Controller extends Marionette.Controller

		initialize: (options = {}) ->
			@contentView = options.view

			@formLayout = @getFormLayout options.config

			@listenTo @formLayout, "show", @formContentRegion()
			@listenTo @formLayout, "close", @close

		onClose: ->
			console.log "Controller closed", @

		formContentRegion: ->
			@layout.formContentRegion.show @contentView

		getFormLayout: (options = {}) ->
			config = @getDefaultConfig _.results(@contentView, "form")

			buttons = @getButtons config.buttons

			new Form.FormWrapper
				config: config
				model: @contentView.model
				buttons:  buttons

		getDefaultConfig: (config = {}) ->
			_.defaults config,
				footer: true
				focusFirstInput: true

		getButtons: (buttons = {}) ->
			App.request("form:buttons:entities", buttons, @contentView.model) unless buttons is false

	App.reqres.setHandler "form:wrapper", (contentView, options = {}) ->
		throw new Error "No model found inside of form's contentView" unless contentView.model
		formController = new Form.Controller
			view: contentView
			config: options
		formController.formLayout