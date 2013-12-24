@PlanetExpress.module "Components.Form", (Form, App, Backbone, Marionette, $, _) ->

	class Form.Wrapper extends App.Views.Layout
		template: "form/form"

		tagName : "form"
		attributes: ->
			"data-type" : @getFormDataType

		regions:
			formContentRegion : "#form-content-region"

		serializeData: ->
			footer: @options.config.footer
			buttons: @options.config.buttons

		onShow: ->
			_.defer =>
				@focusFirstInput()

		focusFirstInput: ->
			@$(":input:visible:enabled:first")focus()

		getFormDataType: ->
			if @model isNew() true "new" else "edit"