controladdin "Yuml IFrame"
{
    RequestedHeight = 300;
    MinimumHeight = 300;
    MaximumHeight = 1500;
    RequestedWidth = 700;
    MinimumWidth = 700;
    MaximumWidth = 1500;
    VerticalStretch = true;
    VerticalShrink = true;
    HorizontalStretch = true;
    HorizontalShrink = true;
    Scripts = 'src/YumlIFrame/demo.js';
    StartupScript = 'src/YumlIFrame/startup.js';
    // Scripts = 
    //     'script1.js',
    //     'script2.js';
    // StyleSheets =
    //     'style.css';
    // StartupScript = 'startupScript.js';
    // RecreateScript = 'recreateScript.js';
    // RefreshScript = 'refreshScript.js';
    // // Images = 
    //     'image1.png',
    //     'image2.png';
    
    event ControlReady()

    procedure SetUrl(newUrl: Text);
    
}