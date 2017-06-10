emotes = {
		["/copmote"] = { cmd = '/copemote', event = 'playCopEmote' },
		["/sitmote"] = { cmd = '/sitmote', event = 'playSitEmote' },
		["/chairmote"] = { cmd = '/chairmote', event = 'playChairEmote' },
		["/kneelmote"] = { cmd = '/kneelmote', event = 'playKneelEmote' },
		["/medicmote"] = { cmd = '/medicmote', event = 'playMedicEmote' },
		["/notepadmote"] = { cmd = '/notepadmote', event = 'playNotepadEmote' },
		["/trafficmote"] = { cmd = '/trafficmote', event = 'playTrafficEmote' },
		["/photomote"] = { cmd = '/photomote', event = 'playPhotoEmote' },
		["/clipboardmote"] = { cmd = '/clipboardmote', event = 'playClipboardEmote' },
		["/leanmote"] = { cmd = '/leanmote', event = 'playLeanEmote' },
		["/smokemote"] = { cmd = '/smokemote', event = 'playSmokeEmote' },
		["/drinkmote"] = { cmd = '/drinkmote', event = 'playDrinkEmote' },
		["/cancelemote"] = { cmd = '/cancelemote', event = 'playCancelEmote' }
}

TriggerEvent('es:addCommand', 'copemote', function(source, args, user)
	TriggerClientEvent('playCopEmote', source);
end)
TriggerEvent('es:addCommand', 'sitemote', function(source, args, user)
	TriggerClientEvent('playSitEmote', source);
end)
TriggerEvent('es:addCommand', 'chairemote', function(source, args, user)
	TriggerClientEvent('playChairEmote', source);
end)
TriggerEvent('es:addCommand', 'kneelemote', function(source, args, user)
	TriggerClientEvent('playKneelEmote', source);
end)
TriggerEvent('es:addCommand', 'notepademote', function(source, args, user)
	TriggerClientEvent('playNotepadEmote', source);
end)
TriggerEvent('es:addCommand', 'trafficemote', function(source, args, user)
	TriggerClientEvent('playTrafficEmote', source);
end)
TriggerEvent('es:addCommand', 'medicemote', function(source, args, user)
	TriggerClientEvent('playMedicEmote', source);
end)
TriggerEvent('es:addCommand', 'photoemote', function(source, args, user)
	TriggerClientEvent('playPhotoEmote', source);
end)
TriggerEvent('es:addCommand', 'clipboardemote', function(source, args, user)
	TriggerClientEvent('playClipboardEmote', source);
end)
TriggerEvent('es:addCommand', 'leanemote', function(source, args, user)
	TriggerClientEvent('playLeanEmote', source);
end)
TriggerEvent('es:addCommand', 'smokeemote', function(source, args, user)
	TriggerClientEvent('playSmokeEmote', source);
end)
TriggerEvent('es:addCommand', 'drinkemote', function(source, args, user)
	TriggerClientEvent('playDrinkEmote', source);
end)
TriggerEvent('es:addCommand', 'cancelemote', function(source, args, user)
	TriggerClientEvent('playCancelEmote', source);
end)
TriggerEvent('es:addCommand', 'emotelist', function(source, args, user)
	TriggerClientEvent('printEmoteList', source);
end)