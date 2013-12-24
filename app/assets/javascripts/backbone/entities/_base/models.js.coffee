@PlanetExpress.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->

	class Entities.Model extends Backbone.Model

		save: (data, options = {}) ->
			_.defaults options,
				wait:true

			super data, options

		saveSuccess: (isNew) =>
			console.info "success", @, isNew
			if isNew
				@trigger "created", @
			else
				@trigger "updated", @