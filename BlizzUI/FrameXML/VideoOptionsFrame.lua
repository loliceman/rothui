-- if you change something here you probably want to change the glue version too

function VideoOptionsFrame_Toggle ()
	if ( VideoOptionsFrame:IsShown() ) then
		VideoOptionsFrame:Hide();
	else
		VideoOptionsFrame:Show();
	end
end

function VideoOptionsFrame_SetAllToDefaults ()
	OptionsFrame_SetAllToDefaults(VideoOptionsFrame);
end

function VideoOptionsFrame_SetCurrentToDefaults ()
	OptionsFrame_SetCurrentToDefaults(VideoOptionsFrame);
end

function VideoOptionsFrame_OnLoad (self)
	OptionsFrame_OnLoad(self);

	_G[self:GetName().."HeaderText"]:SetText(VIDEOOPTIONS_MENU);
end

function VideoOptionsFrame_OnHide (self)
	OptionsFrame_OnHide(self);

	if ( VideoOptionsFrame.gameRestart ) then
		StaticPopup_Show("CLIENT_RESTART_ALERT");
		VideoOptionsFrame.gameRestart = nil;
	elseif ( VideoOptionsFrame.logout ) then
		StaticPopup_Show("CLIENT_LOGOUT_ALERT");
		VideoOptionsFrame.logout = nil;
	end
end

function VideoOptionsFrameOkay_OnClick (apply)
	OptionsFrameOkay_OnClick(VideoOptionsFrame, apply);

	if ( VideoOptionsFrame.gxRestart ) then
		VideoOptionsFrame.gxRestart = nil;
		RestartGx();
	end

	if ( not apply ) then
		VideoOptionsFrame_Toggle();
	end
end

function VideoOptionsFrameCancel_OnClick ()
	OptionsFrameCancel_OnClick(VideoOptionsFrame);

	if ( VideoOptionsFrame.gxRestart ) then
		VideoOptionsFrame.gxRestart = nil;
		RestartGx();
	end

	VideoOptionsFrame.logout = nil;
	VideoOptionsFrame.gameRestart = nil;

	VideoOptionsFrame_Toggle();
end

function VideoOptionsFrameDefault_OnClick ()
	OptionsFrameDefault_OnClick(VideoOptionsFrame);

	StaticPopup_Show("CONFIRM_RESET_VIDEO_SETTINGS");
end

