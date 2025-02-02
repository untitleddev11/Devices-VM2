# Devices-VM

Hello, this is my open-source script. Feel free to upload this as your own.
If you encounter any issues, please let me know via discord (@devllce).
If you are wondering what the newest/updated config layout is, here it is:

getgenv().CheatSettings = { --> Deleting this will break the script
    Aiming = {
        AimLock = true,
        SilentAim = true,
        AimLockBind = Enum.KeyCode.C,
        AimPrediction = 0.1013,
        SilentPrediction = 0.1355,
        MultiParts = true,
        BodyPart = "UpperTorso",
        BodyParts = {"Head", "UpperTorso", "LowerTorso", "LeftUpperArm", "RightUpperArm"},
        AimSmoothing = 0.0085, --> Legit: 0.0085 - 0.0100. Blatant: 0.0525 - 0.0754.
    },
    Preferences = {
        CheckKO = true, --> unlocks if target is knocked or dead if on
        CheckPlayerKO = true, --> unlocks if player is knocked or dead if on
        VisibilityCheck = true,
        SilentAimMouseDistanceCheck = true,
        MaxMouseDistance = 48, --> Distance check to see if the cursor is too far from the target, making the silent aim stop working to prevent CRAZY curves.
        Notify = true,
		DrawFOV = true
    }
}
