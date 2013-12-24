@PlanetExpress.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->

	class Entities.Button extends Entities.Model

	class Entities.ButtonsCollections extends Entities.Collection
		model: Entities.Button

	API =
		getFormButtons: (buttons, model) ->
			buttons = @getDefaultButtons buttons, model

			array = []
			array.push {type:"cancel", className: "button small secondary radius", text: buttons.cancel}
			array.push {type: "primary", className: "button small radius", text: buttons.primary}

			array.reverse() if buttons.placement is "left"

			buttonCollection = new Entities.ButtonCollection array
			buttonCollection.placement = buttons.placement
			buttonCollection

		getDefaultButtons: (buttons, model) ->
			_.defaults buttons,
				primary: if modelisNew() then "Create" else "New"
				cancel: "Cancel"
				placement: "Right"

	API.reqres.setHandler "form:entities:buttons", (buttons ={}, model) ->
		API.getFormButtons buttons, model