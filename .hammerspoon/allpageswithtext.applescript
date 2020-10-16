-- This script allows the user to enter text to imprint on all pages.

tell application "PDFpen"
	if (count documents) > 0 then
		set dialogResult to display dialog "Enter text:" default answer "Draft"
		if button returned of dialogResult is not null then
			set theText to text returned of dialogResult
			tell document 1
				set imprintCount to 0
				set pageCount to count pages
				repeat with aPage in pages
					set theImprint to make new text imprint with properties {rich text:theText} at end of imprints of aPage
					set font of attribute run 1 of rich text of theImprint to "LucidaGrande-Bold"
					set size of attribute run 1 of rich text of theImprint to 30
					set color of theImprint to {1, 0, 0}
				end repeat
				return pageCount
			end tell
		end if
	end if
end tell
