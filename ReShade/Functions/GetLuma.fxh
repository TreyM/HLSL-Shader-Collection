// GET LUMA ////////////////////////////////////////
// - TreyM                                        //
// Calculates perceived luminance using ITU-R BT  //
// standards                                      //
////////////////////////////////////////////////////
// This work is licensed under the                //
// Creative Commons                               //
// Attribution-NonCommercial-ShareAlike 4.0       //
// International License.                         //
// To view a copy of this license, visit          //
// CreativeCommons.org/licenses/by-nc-sa/4.0/     //
////////////////////////////////////////////////////

//////////////////////////////////////////////////
// LUMA COEFFICIENTS /////////////////////////////
#define Rec709      0
#define Rec709_5    1
#define Rec601      2
#define Rec2020     3
#define Lum333      4

//////////////////////////////////////////////////
// FUNCTION //////////////////////////////////////
// Calculate perceived luminance color by using the ITU-R BT standards
float GetLuma(in float3 color, int btspec)
{
    static const float3 LumaCoeff[5] =
    {
        // 0: HD TV - Rec.709
        float3(0.2126, 0.7152f, 0.0722),
        // 1: HD TV - Rec.709-5
        float3(0.212395, 0.701049, 0.086556),
        // 2: CRT TV - Rec.601
        float3(0.299, 0.587, 0.114),
        // 3: HDR Spec - Rec.2020
        float3(0.2627, 0.6780, 0.0593),
        // 4: Incorrect Equal Weighting
        float3(0.3333, 0.3333, 0.3333)
    };

    return dot(color.rgb, LumaCoeff[btspec]);
}

//////////////////////////////////////////////////
//  Function Call:                              //
//  color.rgb = GetLuma(color.rgb, Rec709);     //
//                                              //
//  Rec709 can be changed to the desired mode   //
//  from the #define list above.                //
//                                              //
//  You can also use a UI integer control       //
//  Example:                                    //
//  color.rgb = GetLuma(color.rgb, UIInteger);  //
//                                              //
//  In the example above, UIInteger would be    //
//  a user adjustable integer value from 0 - 4  //
//////////////////////////////////////////////////
