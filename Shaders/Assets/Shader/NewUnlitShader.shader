// �� ���̴��� �޽��� �̸� ������ Į��� ä��� ���̴��Դϴ� 
Shader"Example/URPUnlitShaderBasic"
{
    // ����Ƽ ���̴��� ������Ƽ ��(�������̽��� ����� ��)�Դϴ�. ������ ��������ϴ�. 
    // �ֳ��ϸ� �����׸�Ʈ (�ȼ�) ���̴� �ڵ忡�� ��� Į�� �� ������ ���� �����Դϴ� 
    Properties
    { }

    // �����̴� ���� ���̴� �ڵ尡 ��� �ֽ��ϴ� 
    SubShader
    {
        // �����̴� �±״� ���� � ���ǿ��� �����̴� ���� �����ϴ��� �Ǵ� 
        //�н��� ����Ǵ����� �����մϴ�. (�׳� ������ ������ �±׶� ���Դϴ�.) 
        Tags { "RenderType" = "Opaque" "RenderPipeline" = "UniversalPipeline" }

        Pass
        {
            // HLSL(High Level Shader Language) �ڵ� ���Դϴ�. SRP�� HLSL�� ����մϴ� 
            HLSLPROGRAM
            // ����� ���ؽ� ���̴��� �̸��� �����ϰ��
            #pragma vertex vert
            // ����� �����׸�Ʈ(�ȼ�) ���̴��� �̸��� �����մϴ�. 
            #pragma fragment frag

            // Core.hlsl ���Ͽ��� ���� ���Ǵ� HLSL ��ũ�γ� �Լ��� ���ǵǾ� �ֽ��ϴ�. 
            // �׸��� �̷��� #include�� ����ϸ� �ٸ� HLSL ���ϵ��� ������ �� �ֽ��ϴ�. 
#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"

            // �� ����ü���� � ������ ��� �ִ��� ���ǵǾ� �ֽ��ϴ�. 
            // �� ���������� Attributes ����ü�� ���ؽ� ���̴��� ��ǲ ����ü�� ����ϰ� �ֽ��ϴ�. 
struct Attributes
{
                // positionOS ������ ������Ʈ �����̽��� ���ؽ� �������� ������ �ֽ��ϴ� 
    float4 positionOS : POSITION;
};

struct Varyings
{
                // �� ����ü�� ������ ������ �ݵ�� SV_POSITION �ø�ƽ�� ������ �־�� �մϴ�. 
    float4 positionHCS : SV_POSITION;
};

            // ���ؽ� ���̴��� Varyings�� ��ҷ� ���ǵ˴ϴ�. 
            // ���ؽ� ���̴��� Ÿ���� �ݵ�� ����� �ִ� ����ü�� Ÿ�԰� ��ġ�ؾ� �մϴ�. 
Varyings vert(Attributes IN)
{
                //  Varyings ����ü�� ���(OUT) ������ ���ݴϴ�. 
    Varyings OUT;
                // TransformObjectToHClip �Լ��� ������Ʈ ��ǥ���� ���ؽ� �������� 
                // Ŭ�������̽��� ��ȯ���ݴϴ�. 
    OUT.positionHCS = TransformObjectToHClip(IN.positionOS.xyz);
                // output�� ������ �ݴϴ�. 
    return OUT;
}

            // �����׸�Ʈ (�ȼ�) ���̴� �����Դϴ�. 
half4 frag() : SV_Target
{
                // ���� �����ϰ� ������ �ݴϴ�. 
    half4 customColor = half4(0.5, 0, 0, 1);
    return customColor;
}
            ENDHLSL
        }
    }
}
��ó: https://chulin28ho.tistory.com/644 [���� ��ư��� ���Ӱ�����:Ƽ���丮]