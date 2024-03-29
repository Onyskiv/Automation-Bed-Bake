/*  
[INFO] 

NAME = Automation Bed Bake
VERSION = 1.1.3
AUTHOR = MastaMan
DEV = 
HELP = help.html

[1.0.0]

* Initial release =

[1.0.1]

* Changed: trimRight "_low" (removed numbers)=

[1.1.0]

* Changed: Added logic with materials usage=

[1.1.1]

+ Added: V-Ray Render Time opiton=

[1.1.2]

* Changed: Render other _low parts=

[1.1.3]

* Changed: Disabled Separate folder checkbutton by default use folder with collection name=
* Changed: Output format from png to jpg=

[ABOUT]

This script automate rendering to texture beds=

[SCRIPT]
*/

try(closeRolloutFloater fAutomationBedBake) catch()
global fAutomationBedBake = newRolloutFloater "Automation Bed Bake" 280 750

rollout _rStepABB0  "Main" (
	
	fn pickMaterialFilter obj = obj.material != undefined 
	
    group "Scenes" (
        listbox lbxScenesList "" height: 7
        button btnAddScene "Add" width: 90 across: 2
        button btnRemoveScene"Remove" width: 90
    )
	
	group "Materials" (
		label lbl1 "This material will be applied to the object with\nmaterial named \"replace-material\"" align: #left  height: 30
		listbox lbxMaterialsList height: 7
		pickbutton btnPickMaterial "Pick" width: 90 across: 2 filter: pickMaterialFilter
		button btnRemoveMaterial "Remove" width: 90
		progressbar hr "" height: 2
		label lbl2 "For this material, all textures with\nname \"replace-texture.jpg\" will be replaced\nwith textures from the folder below" align: #left  height: 40
		edittext edtReplaceTexturePath "" readonly: true height: 22
		button btnSelectMatTexFolderPath "Select Path"
	)
    
	group "Bake&&Render Settings" (
		spinner spnVrayRenderTime "V-Ray Render Time: " range: [0, 10000.0, 2.0] type: #float align: #left fieldWidth: 40
		spinner spnPadding "Padding:                   " range: [0, 100, 16] type: #integer align: #left fieldWidth: 40
		dropdownlist ddlTexturesRes "Textures Size: " items: #("2048x2048", "1024x1024", "512x512", "256x256", "128x128", "16x16")
	)

    group "Save Baked Textures To" (
        checkbox cbxUseSeparateFolders "Use separate folders" checked: true
        edittext edtBatchRenderPath "" readonly: true across: 2 align: #left fieldwidth: 195 height: 22
        button btnSetBatchRenderPath "..." width: 35 height: 23 align: #right offset: [0, -1]
        
        button btnStartRender "Start Bake Textures" height: 35 width: 240 offset: [0, 10]
    )

    global iniVaultSettingsABB = ""
    global iniLogABB = ""

    fn getScenes = getIniSetting iniVaultSettingsABB "SCENES"
    fn addScenes m = for i in m do setIniSetting iniVaultSettingsABB "SCENES" i ""
    
    fn getOpenModels = (
        f = #()
        
        modelsDialog = dotNetObject "System.Windows.Forms.OpenFileDialog" 
        modelsDialog.title = "Select Models"
        modelsDialog.Multiselect = true
        modelsDialog.Filter = "3D Studio Max (*.max)|*.max"
        modelsDialog.FilterIndex = 1
        
        result = modelsDialog.showDialog() 
        result.ToString() 
        result.Equals result.OK 
        result.Equals result.Cancel 
        
        f = modelsDialog.fileNames 
         
        return f
    )

    fn updateList = (
        m = getScenes()
        
        lbxScenesList.items = for i in m collect getFilenameFile i
    )

	fn getMatListKey showError: false = (
		sel = lbxMaterialsList.selected
		id = lbxMaterialsList.selection
		
		if(id == 0) do (
			if(showError) do messageBox "Please select Material from list!" title: "Warning!"	
			return undefined
		)
		
		return substituteString sel "[Empty Path] " ""
	)
	
	fn getMaterialsSetup = getIniSetting iniVaultSettingsABB "MATERIALS"
	
	fn implode a tag: ", " = (
		ret = ""
		for i in 1 to a.count do ret += a[i] + (if(i == a.count) then "" else tag)
		return ret
	)
	
	fn getMaterialsAndPaths showError: false = (
		mm = getMaterialsSetup()
		
		o = objects as array
		res = #()
		
		for i in mm do (
			for ii in o where ii.material != undefined and (matchPattern ii.material.name pattern: (i + "*")) do (
				p = getIniSetting iniVaultSettingsABB "MATERIALS" i
				-- material, name, object, path
				appendIfUnique res #(ii.material, i, ii, p)
				exit
			)
		)
		msg = ""

		if(mm.count != res.count) do (
			foundNames = for i in res collect i[2]
			notFoundNames = for i in mm where (appendIfUnique foundNames i) collect i
			if(notFoundNames.count > 0) do (
				msg = "Next materials not found: "
				msg += implode notFoundNames
				msg += "!"
				
				return #(undefined, msg)
			)
		)
		
		notFoundPaths = for i in res where (not doesFileExist i[4]) or i[4] == "" collect i[2]
		if(notFoundPaths.count > 0) do (
			msg = "Please choose Textures path for next materials: "
			msg += implode notFoundPaths
			msg += "!"
			
			return #(undefined, msg)
		)
		
		return #(res, msg)
	)
	
	fn updateMatList = (
		mm = getMaterialsSetup()
	
		res = #()
		for i in mm do (
			v = getIniSetting iniVaultSettingsABB "MATERIALS" i
			if(v == "" or not doesFileExist v) then (
				print v
				append res ("[Empty Path] " + i)
			) else (
				append res i
			)
		)
		
		lbxMaterialsList.items = res
		n = getMatListKey showError: false
		if(n != undefined) do (
			p = getIniSetting iniVaultSettingsABB "MATERIALS" n
			edtReplaceTexturePath.text = p
		)
	)
		
	on btnPickMaterial picked obj do (
		if(obj == undefined) do return false
        
        n = obj.material.name
		
		mm = getIniSetting iniVaultSettingsABB "MATERIALS" n
		if(mm != "") do return updateMatList()
		
		setIniSetting iniVaultSettingsABB "MATERIALS" n ""
		
		updateMatList()
	)
	
	on btnRemoveMaterial pressed do (
		n = getMatListKey showError: true
		if(n == undefined) do return false
		
		--q = queryBox ("Do you really want to delete Material \"" + n + "\" from list?") title: "Confirm?"
		--if(not q) do return false
		
		delIniSetting iniVaultSettingsABB "MATERIALS" n
		edtReplaceTexturePath.text = ""
		
		updateMatList()
	)
	
	on btnSelectMatTexFolderPath pressed do (
		n = getMatListKey showError: true
		if(n == undefined) do return false
		
		f = getSaveFileName filename: "DO NOT CHANGE NAME" caption:"Save File" types:"JPEG (*.jpg)|*.jpg"
        if(f == undefined) do return false

        p = getFileNamePath f
		
		setIniSetting iniVaultSettingsABB "MATERIALS" n p
		 
		updateMatList()  
	)
	
	on spnPadding changed v do (
		setIniSetting iniVaultSettingsABB "RENDER" "PADDING" (v as string)
	)
	
	on spnVrayRenderTime changed v do (
		setIniSetting iniVaultSettingsABB "RENDER" "RENDER_TIME" (v as string)
	)
	
	on lbxMaterialsList selected v do (
		updateMatList()  
	)
	
	fn loadPadding = (
		v = getIniSetting iniVaultSettingsABB "RENDER" "PADDING"
		if(v == "") do v = 4
		spnPadding.value = v as integer
    )	
	
	fn loadRenderTime = (
		v = getIniSetting iniVaultSettingsABB "RENDER" "RENDER_TIME"
		if(v == "") do v = 2.0
		spnVrayRenderTime.value = v as float
    )
    
	fn loadRenderTexturesSize = (
		v = getIniSetting iniVaultSettingsABB "RENDER" "SIZE"
		if(v == "") do v = 1
		ddlTexturesRes.selection = v as integer
    )

    fn loadRenderSettings = (
        v = getIniSetting iniVaultSettingsABB "RENDER" "RENDER_TO"
        edtBatchRenderPath.text = ""
        if(v != "") do (
            edtBatchRenderPath.text = v
        )

        v = getIniSetting iniVaultSettingsABB "RENDER" "USE_SEPARATE_FOLDERS"
        if(v == "1") then (
            cbxUseSeparateFolders.checked = true
        ) else if (v == "0") then (
			cbxUseSeparateFolders.checked = false
		)
    )
	
	fn getTexturesSize = (
		s = ddlTexturesRes.selected
		return for i in (filterString s "x") collect i as integer
	)
	
	fn getTextures p ignore: "replace-texture" = (
		tex = #()
		
		types = #(".jpg", ".png", ".tiff", ".gif", ".bmp", ".tga")
		for i in types do join tex (getFiles (p + @"\*" + i))
		
		out = for i in tex where (getFilenameFile i) != ignore collect i
			
		return out
	)
	
	fn getObjects  = (
		o = #()
		for i in (objects as array) do (
			n = trimRight i.name "0123456789"
			if(matchPattern n pattern: "*_low") do append o i
		)
		
		return o
	)
	
	on ddlTexturesRes selected  v do (
		v = v as string
		setIniSetting iniVaultSettingsABB "RENDER" "SIZE" v
	)
    
    on cbxUseSeparateFolders changed v do (
        setIniSetting iniVaultSettingsABB "RENDER" "USE_SEPARATE_FOLDERS"  (if(v) then "1" else "0")
    )
    
    on btnSetBatchRenderPath pressed do (
        f = getSaveFileName filename: "DO NOT CHANGE NAME" caption:"Save File" types:"JPEG (*.jpg)|*.jpg"
        if(f == undefined) do return false
        
        p = getFileNamePath f
                
        setIniSetting iniVaultSettingsABB "RENDER" "RENDER_TO" p
        
        loadRenderSettings()
    )
    
    on btnAddScene pressed do (
        f = getOpenModels()
                
        if(f == undefined) do return false
                
        addScenes f
                
        updateList()
    )
    
    on btnRemoveScene pressed do (
        id = lbxScenesList.selection
        
        if(id == 0) do return false
        
        m = getScenes()
        
        delIniSetting iniVaultSettingsABB "SCENES" m[id]
                
        updateList()
    )

    on _rStepABB0 open do (
        iniVaultSettingsABB = getThisScriptFilename() + ".ini"
        
        updateList()
		updateMatList()
		loadRenderTexturesSize()
        loadRenderSettings()
		loadPadding()
		loadRenderTime()
    )
	
	fn getBitmapsToReplace m n: "replace-texture" = (
		o = #()
		for b in getClassInstances Bitmaptexture  target:m do (
			if(b.filename == undefined) do continue
			f = getFilenameFile  b.filename			
			if(f == n) do append o b
		)
		return o
	)
	
	fn isVray = (
		r = renderers.current as string
		if matchpattern r pattern:"*V_Ray_*" do return true
		return false
	)
	
	fn toFixed v p: 2 = (
		a = v * (10^p)
		b = a as integer
		a = b as float / (10^p)
		return a
	)
	
	fn toTime v = (
		v = toFixed v
		
		h = 0
		s = ((v - ((v as integer) as float)) * 60.0) as integer
		m = v as integer
		if(m >= 60) do (
			h = toFixed (m / 60.0)
			m = (m - ((h as integer) * 60)) as integer
			h = h as integer
		)
		
		if(h > 0) then (h = (h as string) + " hrs  ") else h = ""
		if(m > 0) then (m = (m as string) + " min  ") else m = ""		
		s = (s as string) + " sec"
		return h + m + s
	)
	
	fn bake size: #(2048, 2048) = (
		start = timeStamp()
		render rendertype: #bakeSelected vfb: off progressBar: true outputSize: [size[1], size[2]]
		end = timeStamp()
		
		return toFixed (((end - start) / 1000.0) / 60.0)
	)
	
	fn logging m name: undefined = (
		t = (localTime as string) + " (" + (timeStamp() as string) + ")"
		print m
		f = iniLogABB
		if(name != undefined) do (
			f = (getFileNamePath f) + name + ".ini"
		)
		setIniSetting f "LOG" t (" > " + m)
	)
	
	fn getReplaceMaterial = (	
		for i in SceneMaterials where (matchPattern i.name pattern: "replace-material*") do return i
		return undefined
	)

	fn getObjectsWithReplaceMaterial = (
		res = #()
		m = getReplaceMaterial()
		if(m == undefined) do return #()
		for ii in refs.dependents m where superClassOf ii == GeometryClass and (matchPattern ii.name pattern: ("*_low*")) do appendIfUnique res ii		
		return res
	)
	
	fn getLowPolyPair a = (
		res = #()
		names = for i in a collect trimRight (trimRight i.name "0123456789") "_high"
			
		o = objects as array
		for i in o do (
			for ii in names where (matchPattern i.name pattern: (ii + "_low*")) do (
				append res i
				exit
			)
		)
		
		return res
	)
	
	on btnStartRender pressed do (
		bakedTexList = #()
		
		_RENDER = true
		clearListener()
		totalTime = 0
		logFileName = substituteString (substituteString (trimRight localTime " APM") "/" "-") ":" "."
		
		scenes = getScenes()
		size = getTexturesSize()
			
		if(scenes.count == 0) do return messageBox "Please add scenes to list!" title: "Warning!"
		for ss in scenes where (not doesFileExist ss) do return messageBox ("Not found scene!\n" + ss) title: "Warning!"
		if(edtBatchRenderPath.text.count == 0 or not doesFileExist edtBatchRenderPath.text) do return messageBox "Please set output Textures Path for save!" title: "Warning!"
	
		iniLogABB = edtBatchRenderPath.text + "log.ini"
		
		try(setVRaySilentMode()) catch()		
		JPEGIO.setQuality 100
		PNGIO.setType #true24
		PNGIO.setAlpha true
		PNGIO.setInterlaced false
			
		for s in scenes where (doesFileExist s) do	(
			loadMaxFile s useFileUnits: true quiet: true
			
			logging ("Info --> Open scene: " +  (filenameFromPath s)) name: logFileName
			
			if(not isVray()) do (
				logging ("Error --> Not assigned render V-Ray for scene: " +  (filenameFromPath s)) name: logFileName
				continue
			)			
			
			-- Set render settings
			vr = renderers.current
			vr.progressive_max_render_time = spnVrayRenderTime.value
			
			lastReplaceMaterial = undefined
			lastReplaceMaterial = getReplaceMaterial()
			models = getObjectsWithReplaceMaterial()
			--models = getLowPolyPair objsWithReplace
			existModels = models
			notUsedModels = for i in getObjects() where (appendIfUnique existModels i) collect i
		
			if(models.count == 0) do (
				logging ("Error --> Models with material name \"replace-material\" not found in: " +  (filenameFromPath s)) name: logFileName
				continue
			)
			
			tmp = getMaterialsAndPaths()
			if(tmp[1] == undefined) do return (
				logging ("Error --> Scene: " +  (filenameFromPath s) + ". " + tmp[2]) name: logFileName
				continue
			)
			
			-- material, name, object, path
			matsAndPaths = tmp[1]
			
			-- material, name, object, path			
			for i in matsAndPaths do (
				targetMaterial = i[1]
				targetName = i[2]
				targetObj = i[3]
				targetPath = i[4]
				
				
				p = targetPath				
				textures = getTextures p
				bb = getBitmapsToReplace targetMaterial
				
				-- Directly replace material
				replaceInstances lastReplaceMaterial targetMaterial
				lastReplaceMaterial = targetMaterial
					
				if(textures.count == 0) do (
					logging ("Error --> Textures in folder not found: " +  p) name: logFileName
				)
				 
				if(bb.count == 0) do (
					logging ("Error --> Not found textures to replace for material: " +  targetName) name: logFileName
				)
				
				/*
				if(bb.count == 0) do (
					q = queryBox ("Not found textures to replace for " + cbxMatBox[i].caption + "!\nDo you want to continue render anyway with default settings?") title: "Confirm?"
					if(not q) do return false
					select models
					bake size: size
					continue
				)*/
				
				for t in textures do (
					for b in bb do b.filename = t
					toSelect = #()
					
					for m in models where (isValidNode m) do (						
						bakeTex = m.INodeBakeProperties
						elementsNum = bakeTex.numBakeElements()
						if(elementsNum != 0) then (
							if(not appendIfUnique toSelect m) do continue
							
							maxName = getFilenameFile maxFileName
							partName = trimRight (trimRight m.name "0123456789") "_low"
							texName = getFilenameFile  t
							
							separateFolder = maxName+ @"\"
							if(cbxUseSeparateFolders.checked) do (
								separateFolder = maxName+ @"\" + partName + @"\"								
							)
							
							makeDir (edtBatchRenderPath.text + separateFolder) all: true
							
							rendName = maxName + "_" + partName + "_" + texName + ".jpg"							
							outFileName = edtBatchRenderPath.text + separateFolder + rendName
							
							bakeTex.nDilations = spnPadding.value
							be1 = bakeTex.getBakeElement 1
							be1.fileType = outFileName
							be1.fileName = filenameFromPath be1.fileType
							be1.outputSzX = size[1]
							be1.outputSzY = size[2]
						) else (
							logging ("Warning --> Not found Element - VrayCompleteMap for model: " +  m.name) name: logFileName
						)
						
						if(_RENDER == false) do exit
					)
					
					for sel in toSelect do (
						clearSelection()
						select sel
						minutes = bake size: size
						totalTime += minutes
						logging ("Baked --> Scene: " + (getFileNameFile s) + " | Model: "+ sel.name + " | Material: " + targetName + " | Texture: " + (filenameFromPath t) + " | Render time: " + (toTime minutes)) name: logFileName
						if (keyboard.escPressed) do (
							logging ("Total time: " + (toTime totalTime)) name: logFileName
							_RENDER = false
							return false
						)	
					)
						
					if (keyboard.escPressed) do (
						_RENDER = false
						return false
					)		
				)

				if(_RENDER == false) do exit
			)
			
			for sel in notUsedModels do (
				bakeTex = sel.INodeBakeProperties
				elementsNum = bakeTex.numBakeElements()
				if(elementsNum != 0) then (
					maxName = getFilenameFile maxFileName
					partName = trimRight (trimRight sel.name "0123456789") "_low"
					
					separateFolder = maxName+ @"\"
					if(cbxUseSeparateFolders.checked) do (
						separateFolder = maxName+ @"\" + partName + @"\"								
					)
					
					makeDir (edtBatchRenderPath.text + separateFolder) all: true
					
					rendName = maxName + "_" + partName + ".jpg"
					outFileName = edtBatchRenderPath.text + separateFolder + rendName
					
					bakeTex.nDilations = spnPadding.value
					be1 = bakeTex.getBakeElement 1
					be1.fileType = outFileName
					be1.fileName = filenameFromPath be1.fileType
					be1.outputSzX = size[1]
					be1.outputSzY = size[2]
				)
				
				clearSelection()
				select sel
				minutes = bake size: size
				totalTime += minutes
				logging ("Baked --> Scene: " + (getFileNameFile s) + " | Model: "+ sel.name + " | Material: " + (sel.material.name as string) + " | Texture: default | Render time: " + (toTime minutes)) name: logFileName
				
				if (keyboard.escPressed) do (
					logging ("Total time: " + (toTime totalTime)) name: logFileName
					_RENDER = false
					return false
				)	
			)
			
			if(_RENDER == false) do exit
		)
		
		logging ("Total time: " + (toTime totalTime)) name: logFileName
	)
)

rollout _rAboutABB "About" 
(
    label lblName "" 
    label lblVer "" 
    
    label lblAuthor "" height: 30
    label lblCopy ""  height: 30
    button btnHelp "Help" enabled: false
    
    fn getScriptInfo s releaseInfo: "" =  (
        if(releaseInfo != "") do
        (
            r = getINISetting s releaseInfo
            return r
        )
        
        v = getINISetting s "INFO" "VERSION"
        a = getINISetting s "INFO" "AUTHOR"
        n = getINISetting s "INFO" "NAME"
        o = getINISetting s "ABOUT"
        c = getINISetting s "INFO" "DEV"
        h = getINISetting s "INFO" "HELP"
        
        r = for i in (getINISetting s) where (i != "ABOUT" and i != "SCRIPT" and i != "COPY") collect i
        
        return #(n, a, v, o, r, c, h)
    )
    
    fn getHelp run: false =
    (
        s = getThisScriptFilename()
        i = getScriptInfo s
        szHelp = (getFilenamePath s) + i[7]
        if(doesFileExist szHelp) do btnHelp.enabled = true
            
        if(run) do ShellLaunch szHelp ""
    )
	
    on btnHelp pressed do getHelp run: true
        
    on _rAboutABB open do
    (
        i = getScriptInfo (getThisScriptFilename())
            
        lblName.caption = i[1]
        lblAuthor.caption = i[2]
        lblVer.caption = i[3]
        lblCopy.caption = i[6]
        
        getHelp()
    )
)

addRollout _rStepABB0 fAutomationBedBake rolledUp:false
addRollout _rAboutABB fAutomationBedBake rolledUp:true 