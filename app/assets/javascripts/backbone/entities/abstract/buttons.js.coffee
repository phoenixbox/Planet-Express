@PlanetExpress.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->

	class Entities.Button extends Entities.Model

	class Entities.ButtonsCollections extends Entities.Collection
		model: Entities.Button

	API =
		getFormButtons: (buttons, model) ->
			buttons = @getDefaultButtons buttons, model

			array = []
			array.push {type:"cancel", className: "button small secondary radius", text: buttons.cancel} unless buttons.cancel is false
			array.push {type: "primary", className: "button small radius", text: buttons.primary} unless buttons.cancel is false

			array.reverse() if buttons.placement is "left"

			buttonCollection = new Entities.ButtonCollection array
			buttonCollection.placement = buttons.placement
			buttonCollection

		getDefaultButtons: (buttons, model) ->
			_.defaults buttons,
				primary: if modelisNew() then "Create" else "New"
				cancel: "Cancel"
				placement: "Right"

	API.reqres.setHandler "form:button:entities", (buttons ={}, model) ->
		API.getFormButtons buttons, model