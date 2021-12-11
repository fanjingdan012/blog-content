---
title: 数学知识树
date: 2020-11-13 18:58:07
tags: Math
mathjax: true
---
# Mathjax
- [LaTeX 数学语法](https://uinika.gitee.io/Zen/LaTex/)
- 知乎equation
  ![](https://www.zhihu.com/equation?tex=%5C%5B%5CDelta+x%3Db-a+cd%5C%5D)

# 函数
- [图像](https://zuotu.91maths.com/)
- 对称
  - 关于y轴对称：偶函数
  - 关于原点对称：奇函数
  - 逆函数关于y=x对称
- 平移
  - 无论x，y, x-b,y-a,-=向正方向平移
- 拉伸
  - 无论x，y，wx=x轴方向压缩图像，Ay=y轴方向压缩图像
  ![拉伸y，拉伸x，平移](https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fdingyue.ws.126.net%2F2021%2F0808%2Fb22510f2g00qxhcdb01brc000d500a0g.gif&refer=http%3A%2F%2Fdingyue.ws.126.net&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1640851390&t=2bd7eaf4a8e09ac211771d0c05950c01)
- Inverse function逆函数，反函数
  - $f^{-1}(x)$ f逆x
  - 微积分
    - 单调增、减，且有限次f'x=0的函数有反函数
    - $\cfrac{dx}{dy}=\cfrac{1}{\cfrac{dy}{dx}}$
   

- 多项式
  - 二项式定理Binnominal theorem $(a+b)^n$ = 杨辉三角系数Pascal Triangle$a^nb^0+....$
    - $f(x)=(1+x)^a=1+ax+\cfrac{a(a-1)}{2!}x^2+...\cfrac{a(a-1)...(a-n+1)}{n!}x^n+o(x^n)$
      - $\cfrac{a(a-1)}{2!}...$ 二项式系数
  - 幂函数
    ![幂函数](https://iknow-pic.cdn.bcebos.com/0ff41bd5ad6eddc4e8af90fb34dbb6fd52663361?x-bce-process%3Dimage%2Fresize%2Cm_lfit%2Cw_600%2Ch_800%2Climit_1%2Fquality%2Cq_85%2Fformat%2Cf_jpg)

    - $y=x^n$
      - 微积分
        - $(x^n)'=nx^{n-1}$
          - e.g. $(x^2)'=2x$
            ![x^2导数的几何意义](https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fimg-blog.csdnimg.cn%2Fimg_convert%2Fd1b873f785b87f54cc3bb9a06951c045.png&refer=http%3A%2F%2Fimg-blog.csdnimg.cn&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1641047700&t=4b7f717780ad17eef5ebe815f4f99ca4)

            - 同理立方体看$(x^3)'=3x^2$
    - 抛物线
    - 双曲线
- exponential指数函数
  ![过(0,1)爆炸](https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fdoc.100lw.com%2Fpic%2Fdc9546940d38581fe517e443%2F1-509-png_6_0_0_462_84_329_230_892.979_1262.879-720-0-1530-720.jpg&refer=http%3A%2F%2Fdoc.100lw.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1640960606&t=a1421330a167398c24d3da616bcd8430)

  - $幂=base底数^{exponent指数}$ 底数>0且$\ne \pm 1$
  - $y=a^x$
  - $a^{x+y}=a^xa^y$
  - $a^{xy}=(a^x)^y=(a^y)^x$
  - $a^nb^n=(ab)^n$
  - $y=e^x$
    - e怎么来的：满足$dy/dx=y$的
      - $\therefore y=1+x+\cfrac{x^2}{2!}+\cfrac{x^3}{3!}+...+\cfrac{x^n}{n!}$ (Tylor series泰勒级数)
        - $\cfrac{1}{1-x}=1+x+x^2+x^3+...+x^n$ |x|<1 Geographical series几何级数
        - $-\ln (1-x)=x+\cfrac{x^2}{2}+\cfrac{x^3}{3}+...$ 调和级数：对几何级数逐项积分
      - x=1时 $\therefore e=1+1+1/2+1/6+...\approx 2.71828$ Euler's number
        - $(1+1/N)^N \rightarrow e$
          - 连续复利
      - $dy/dx=cy$ 则$y=e^ cx$
    - $e^xe^\Delta x=e^(x+\Delta x)$
      - $1+(x+\Delta x)+1/2(x+\Delta x)^2+1/6(x+\Delta x)^3$
  - 微积分
    - $(a^x)'=a^x\ln a$

- 对数函数
  ![过(1,0)缓增](https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fwww.wassk.cn%2FMyftp%2Fupload%2Fjlsj%2Ffile%2FcodeTempMain%2F201401%2FC20131206112713952%2F20140829154206624.jpg&refer=http%3A%2F%2Fwww.wassk.cn&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1640960683&t=2496dc2dea09ce69b40b6a43877f4862)

  - $\log_{n底数} x真数$
  - $\log_{n} x$
  - $\lg a+\lg b=\lg ab$
  - $\ln x$ is inverse function of $e^x$
  - $\lg x$
  - 换底公式$\log_{a} b=\cfrac{\log_{c} b}{\log_{c} a}$
  - 指系$\log_{a} nx^m=\cfrac{m}{n}\log_{a} x$
  - 互换$m^{\log_{a} n}=n^{\log_{a} m}$
  - 倒数$\log_{a} n=\cfrac{1}{log_{n} a}$
  - 链式$\log_{b} a\log_{c} b=\log_{c} a$
  - 微积分
    - $\log_{a}' x = \cfrac{1}{x \ln a}$
    - $\ln'x = \cfrac{1}{x}$
    - $\int \ln x=x\ln x-x$
    - 麦克劳林： $\ln(1-x)=x+\cfrac{x^2}{2}+\cfrac{x^3}{3}+\cfrac{x^4}{4}+...$

- step 函数
  $$
  \begin{equation}
    y=\begin{cases}
      0 & \text{if $x<0$},\\
      1 & \text{if $x>=0$.}
      \end{cases}
  \end{equation}
  $$
  $$
  \int y=\begin{cases}
      0 & \text{if $x<0$},\\
      x & \text{if $x>=0$}.
      \end{cases}
  $$
  $$
  y'=\begin{cases}
      0      & \text{if $x \ne 0$},\\
      \infty & \text{if $x=0$}. spike尖刺
      \end{cases}
  $$
- sign 函数
  $$
  \begin{equation}
    sign(x)=\begin{cases}
          -1 & \text{if $x<0$},\\
          0 & \text{if $x=0$},\\
          1 & \text{if $x>0$}.
         \end{cases}
  \end{equation}
  $$

# 三角
![图像](https://gimg2.baidu.com/image_search/src=http%3A%2F%2Ffile1.renrendoc.com%2Ffileroot_temp2%2F2020-12%2F4%2Fa9a1e77a-e13b-4f04-9513-4e4b6fda31d0%2Fa9a1e77a-e13b-4f04-9513-4e4b6fda31d03.gif&refer=http%3A%2F%2Ffile1.renrendoc.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1640927932&t=0b46dabd561e152c6fd50dfb4a7b6fe9)

- 定义
  ![三角函数定义](https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fupload.wikimedia.org%2Fwikipedia%2Fcommons%2Fthumb%2Ff%2Ffe%2FUnit-circle_sin_cos_tan_cot_exsec_excsc_versin_cvs.svg%2F380px-Unit-circle_sin_cos_tan_cot_exsec_excsc_versin_cvs.svg.png&refer=http%3A%2F%2Fupload.wikimedia.org&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1640799665&t=5e27fd30870513af811713e86d8285d2)
  ![三角函数定义](/MathKT/tri.png)

  - $secx={1 \over cosx}=\cfrac{斜边}{邻边}$
  - $cscx={1 \over sinx}=\cfrac{斜边}{对边}$
- 诱导公式
  - 奇变偶不变，符号看象限
  - $sin(x+\pi/2)=cos(x)$
- 毕达哥拉斯定理=勾股定理 $a^2 + b^2 = c^2$
  - $sin^2 \alpha + cos^2 \alpha = 1$
  - 两边除以$cos^2 \Rightarrow tan^2a + 1 =sec^2a$
  - 两边除以$sin^2 \Rightarrow cot^2a + 1 =csc^2a$
  - 特殊三角形：
    - 1,$\sqrt{3}$,2
    - 1,1,$\sqrt{2}$
- 和角公式
  - (1) $sin(a+b)=sinacosb+sinbcosa$
    - (2) $b\rightarrow-b \therefore sin(a-b)=sinacosb-sinbcosa$
    - 倍角 $b\rightarrow a \therefore sin(2a)=2sinacosa$
  - (3) $cos(a+b)=cosacosb-sinasinb$
    - (4) $b\rightarrow-b\therefore cos(a-b)=cosacosb+sinasinb$
    - 倍角 $b\rightarrow a \therefore cos(2a)=cos^2a-sin^2a=2cos^2a-1=1-2sin^2a$
  - $tan(a+b)=\cfrac{tana+tanb}{1-tanatanb}$
  - 证明
    ![证明](https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fgss1.bdstatic.com%2F-vo3dSag_xI4khGkpoWK1HF6hhy%2Fbaike%2Fs%3D220%2Fsign%3D32b52ca484d6277fed12353a18391f63%2F7acb0a46f21fbe09ded77b0b68600c338744ad20.jpg&refer=http%3A%2F%2Fgss1.bdstatic.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1640932813&t=a3ec5dd30adfe1f67b81fef70d034b9f)
    - $tan(a+b)=\cfrac{sinacosb+sinbcosa}{cosacosb-sinasinb}=\cfrac{tana+tanb}{1-tanatanb}$ 上下÷cosacosb
  - 积化和差
    - $(1)+(2)=(5)\therefore sinacosb=1/2[sin(a+b)+sin(a-b)]$
    - $(1)-(2)=(6)\therefore sinbcosa=1/2[sin(a+b)-sin(a-b)]$
    - $(3)+(4)=(7)\therefore cosacosb=1/2[cos(a+b)+cos(a-b)]$
    - $(3)-(4)=(8)\therefore sinasinb=1/2[cos(a+b)-cos(a-b)]$
  - $a+b\rightarrow a \& a-b\rightarrow b \therefore$和差化积
    - $(5)\Rightarrow sina+sinb=2sin\cfrac{a+b}{2}cos\cfrac{a-b}{2}$
    - $(6)\Rightarrow sina-sinb=2sin\cfrac{a+b}{2}cos\cfrac{a-b}{2}$
    - $(7)\Rightarrow cosa+cosb=2sin\cfrac{a+b}{2}cos\cfrac{a-b}{2}$
    - $(8)\Rightarrow sina+sinb=2sin\cfrac{a+b}{2}cos\cfrac{a-b}{2}$
    - $tana+tanb=$
- 正弦定理
  - $\cfrac{a}{sinA}=\cfrac{b}{sinB}=\cfrac{c}{sinC}=2R$
    - R是外接圆半径
- 余弦定理
  - $a^2=b^2+c^2-2bccosA$
  - $b^2=a^2+c^2-2accosB$
  - $c^2=a^2+b^2-2abcosC$
- 正切定理
  - $\cfrac{a+b}{a-b}=\cfrac{tan\cfrac{A+B}{2}}{tan\cfrac{A-B}{2}}$
- 微积分
  ![三角函数](https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fgss0.baidu.com%2F94o3dSag_xI4khGko9WTAnF6hhy%2Fzhidao%2Fwh%253D450%252C600%2Fsign%3Dbffbc791bd8f8c54e386cd2b0f1901c3%2F8644ebf81a4c510fc953e3656959252dd42aa53d.jpg&refer=http%3A%2F%2Fgss0.baidu.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1640961032&t=b608adfc38e69017a601918f6c2ff9b1)

  - $sin \theta<\theta$ $\because$高<弧长
  - $tan\theta>\theta$
    - $\because$弧长<外面的高
    - $\because$扇形面积<三角形面积,$1/2\theta<1/2tan\theta$
  - $sin'x=cosx$
    - 证明: $\cfrac{sin(x+\Delta x)-sinx} {\Delta x}=\cfrac{sinx(cos\Delta x-1)+cosxsin\Delta x} {\Delta x}=cosx$
      - $\because \cfrac{(cos\Delta x-1)}{\Delta x} \rightarrow 0$
      - $\because =\cfrac{cos\Delta x-cos0}{\Delta x-0}=cos'x=-sinx=0$
      ![sin prime](/MathKT/sinp.png)

    - $arcsin'x=\cfrac{1}{\sqrt{1-x^2}}$
      - 证明: $\sin(arcsinx)=x \therefore cos(arcsinx)arcsin'x=1 \therefore arcsin'x=\cfrac{1}{\sqrt{1-x^2}}$
    - 麦克劳林
      - $sinx=x-\cfrac{x^3}{3!}+\cfrac{x^5}{5!}-\cfrac{x^7}{7!}+...$
  - $cos'x=-sinx$
    - 证明: $\cfrac{cos(x+\Delta x)-cosx} {\Delta x}=\cfrac{cosx(cos\Delta x-1)-sinxsin\Delta x} {\Delta x}=-sinx$
    - $arccos'x=-\cfrac{1}{\sqrt{1-x^2}}$
      - 证明: $\cos(arccosx)=x \therefore -sin(arccosx)arccos'x=1 \therefore so$
    - 麦克劳林
      - $cosx=1-\cfrac{x^2}{2!}+\cfrac{x^4}{4!}-\cfrac{x^6}{6!}+...$
  - $tan'x=\cfrac{1}{cos^2x}=sec^2x$
    - 证明: $(\cfrac{sinx}{cosx})'=\cfrac{sin'xcosx-cos'xsinx}{cos^2x}$
    - $arctan'x=\cfrac{1}{1+x^2}$
      - 证明: $\tan(arctanx)=x \therefore sec^2(arctanx)arctan'x=1 \therefore so$
  - $cot'x=-\cfrac{1}{sin^2x}=-csc^2x$
    - 证明: $(\cfrac{cosx}{sinx})'=\cfrac{cos'xsinx-sin'xcosx}{sin^2x}$
    - $arccot'x=-\cfrac{1}{1+x^2}$
      - 证明: $\tan(arccotx)=x \therefore -csc^2(arctanx)arctan'x=1 \therefore so$
  - $sec'x=secxtanx$
    - 证明: $(cos^{-1}x)'=-cos^{-2}x(-sinx)$
    - $arcsec'x=\cfrac{1}{x\sqrt{x^2-1}}$
      - 证明: $\sec(arcsecx)=x \therefore sec(arctanx)tan(arctanx)arctan'x=1 \therefore so$
  - $csc'x=-cscxcotx$
    - $arccsc'x=-\cfrac{1}{x\sqrt{x^2-1}}$
## 双曲函数
  ![双曲函数](https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fhealth.eduboo.com%2Fuploads%2Fprojects%2F574%2F8730.jpg&refer=http%3A%2F%2Fhealth.eduboo.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1641015337&t=5d814febe17d3898749bf1dd75f60e25)

  - $shx=\cfrac{e^x-e^{-x}}{2}$
    - $sh'x=chx$
    - $arshx=\ln (x+\sqrt{x^2+1})$
    - $arsh'x=\cfrac{1}{\sqrt{x^2+1}}$
  - $chx=\cfrac{e^x+e^{-x}}{2}$
    - $ch'x=shx$
    - $archx=\ln (x+\sqrt{x^2-1})$
    - $arch'x=\cfrac{1}{\sqrt{x^2-1}}$
  - $thx=\cfrac{e^x-e^{-x}}{e^x+e^{-x}}=\cfrac{shx}{chx}$
    - $th'x=\cfrac{1}{ch^2x}$
    - $arthx=1/2\ln (\cfrac{1+x}{1-x})$
    - $arth'x=\cfrac{1}{1-x^2}$


## polar coordinate极坐标
- $P(r,\theta)$


# 几何

## 直线
- $y=ax+b$

## 抛物线
- $y=a(x+b)^2+c$
  - 焦点$(p/2,0)$
  - 离心率e=1
  - 准线$x=-p/2$
  - a开合 大->合
  - b左右
  - c上下
  - 方程$ax^2+bx+x=0$
    - 判别式$\Delta = b^2-4ac$ >0 有解
    - 根=$\cfrac{-b \pm \sqrt{b^2-4ac}}{2a}$
    - 韦达定理：两个根的关系
      - $x_1+x_2=-\cfrac{b}{a}$
      - $x_1x_2=\cfrac{c}{a}$
      - 推广$a_nx^n+a_{n-1}x^{n-1}+...+a_1x+a_0=0$的根$x_1,x_2,...x_n$
        - $x_1+x_2+...+x_n=\sum_{i=1}^n x_i=-\cfrac{a_n-1}{a_n}$
        - $x_1x_2...x_n=\prod_{i=1}^n x_i=(-1)^n\cfrac{a_0}{a_n}$

## 圆
- 周长=$2\pi r$
  - > $2\pi = 360^\circ$
- 面积=$\pi r^2$
  - 扇形面积=$r^2\theta/2$
    - 单位圆: $\theta/2$

## Ellipse椭圆
![椭圆](https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fimg.mianfeiwendang.com%2Fpic%2F0f4b011fbf078559d1534e83675a68915a52b173%2F1-945-png_6_0_0_82_669_230_168_837.36_1161.36-992-0-259-992.jpg&refer=http%3A%2F%2Fimg.mianfeiwendang.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1640956916&t=1608dc06225373d1ee82c078cbc19df8)

- > 满足|PF1|+|PF2|=2a（2a>|F1F2|）的P点集合
  - F1、F2焦点,焦距=2c
  - 长轴=2a
  - 短轴=2b
  - 准线$x=\pm \cfrac{a^2}{c}$
  - $c^2=a^2-b^2$
- 标准方程$\cfrac{x^2}{a^2}+\cfrac{y^2}{b^2}=1$
- 面积=$\pi ab$
- 在（x0，y0）点的切线就是 ：$\cfrac{xx0}{a^2}+\cfrac{yy0}{b^2}=1$
  - 切线的斜率是：$\cfrac{-b^2x0}{a^2y0}$
- 离心率$e=\cfrac{c}{a}=\sqrt{1-\cfrac{b^2}{a^2}}$ 圆`0<e<1`扁
- 周长T(b+a)
  - T为椭圆系数，可以由b/a的值，查表找出系数T值；
- 定理1：若直线AB切椭圆C于点P，且A和B在直线上位于P的两侧，则∠APF1=∠BPF2。（也就是说，椭圆在点P处的切线即为∠F1PF2的外角平分线所在的直线）。
- 定理2：若直线AB为C在P点的法线，则AB平分∠F1PF2。

## 双曲线
![双曲线](https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fgss1.bdstatic.com%2F9vo3dSag_xI4khGkpoWK1HF6hhy%2Fbaike%2Fs%3D220%2Fsign%3D01f245a9bc3eb13540c7b0b9961fa8cb%2F38dbb6fd5266d01688dcf769972bd40734fa35ad.jpg&refer=http%3A%2F%2Fgss1.bdstatic.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1640959823&t=8f713c4d2d1a19f599c6c5e7d2236aa1)

- > 满足||PF1|-|PF2||=2a的P点集合
  - F1 F2焦点，焦距=2c
  - 实轴=2a
  - 虚轴=2b
  - 两条准线$x=\pm \cfrac{a^2}{c}$
  - 两条渐近线$y=\pm \cfrac{b}{a}x$
    - 设双曲线的右准线和一条渐近线交于P，A是右支的端点，F是右焦点，那么OP=OA，OP⊥PF。左边同理。根据这个性质，过焦点作渐近线的垂线，垂足一定在准线上，并且Rt△OPF的三边恰好为a、b、c。
    - 过双曲线上任意一点P作某条渐近线的平行线，交准线于Q，则PQ=PF。
    - 过双曲线上一点P作x（y）轴的平行线，交渐近线于A、B，则$PAPB=a²（b²）$。
    - 过双曲线上一点P作两条渐近线的垂线PM、PN，则$PMPN=\cfrac{a^2b^2(b^2-a^2)}{c^4}$
- 标准方程$\cfrac{x^2}{a^2}-\cfrac{y^2}{b^2}=1 a>0 b>0$
  - 定点叫双曲线的焦点，两焦点之间的距离称为焦距，用2c表示

- 离心率$e=\cfrac{c}{a}>1$

## 图像旋转

# 立体几何
## 球


- 体积$V=\cfrac{4}{3}\pi r^3$
  ![切成无数片圆积分](https://img1.baidu.com/it/u=1060714743,4198444281&fm=26&fmt=auto)

  - $\because V=\int_{-r}^{r}\pi (r^2-x^2) dx=(\pi r^2x-\cfrac{x^3}{3})|_{-r}^r$
- 表面积$S=4\pi r^2$
  - 体积剥洋葱微分
  - $\because S=\cfrac{dV}{dr}$

# 复数
- $i=\sqrt{-1}$
- 欧拉公式
  - $e^{ix}=cosx+isinx$
    - $\therefore sinx=\cfrac{1}{2i}(e^{ix}-e{-ix})$
    - $\therefore cosx=\cfrac{1}{2}(e^{ix}+e{-ix})$
    - $e^{i\pi}=-1$
    - 证明：用Tylor展开
  - 乘i就是逆时针转90°

# 微积分
- [《图解普林斯顿微积分读本》系列合集](https://zhuanlan.zhihu.com/p/31199228)

## 极限
- $\infty - \infty$
- $0 * \infty$
- $A/B$
  - $0/0$
    - 法国人l'Hopital 洛必达 $f/g=f'/g'$
      - $\because \cfrac{df}{dg}=\cfrac{df/dx}{dg/dx}$
      - 如果f'或g'$\rightarrow \infty$ 失效
  - $\infty / \infty$
- $A^B$
  - $0^0$
    - $a^0=1$
    - $0^a=0$
  - $1^ \infty$
    - $(1+1/n)^n \rightarrow e$
    - $(1+1/n^2)^n \rightarrow 1$
- 连续和可导性
  - continuous: $f(x) \rightarrow f(a) as x \rightarrow a$ 可以一笔画出函数图
    - 单侧连续
    - 双侧连续 左极限=右极限
    - 在区间连续
    - 介值定理
      - 零点定理：f在[a,b]连续，且f(a)<0,f(b)>0,则$\exists c$ s.t. f(c)=0
    - 最大值最小值定理：f在[a,b]连续，则$\exists max min$
    - $\forall \epsilon \exists \delta s.t. if |x-a|< \delta , then |f(x)-f(a)| < \epsilon$
  - 可导=可微：左右导数都存在且相等：光滑
    - y=|x|在x=0处不可导，但连续
    - 魏尔斯特拉斯函数：连续但处处不可导


## 微分
![微分的几何意义](https://ss1.baidu.com/-4o3dSag_xI4khGko9WTAnF6hhy/baike/g=0;w=268/sign=4e4a60d9b07eca8002053cece61ea5eb/ac4bd11373f08202a6f457c54bfbfbedaa641be2.jpg)

- The differential微分
- 一阶导数 Derivative
  - Speed, Slope
  - 求极值
    - > stationary point驻点=critical point临界点:f'=0或不存在
      - f'=0的情况，可以算f'左右和f''分辨
        - f的局部极值
          - max: f''<0
          - min: f''>0
        - f的水平拐点
  - 求[a,b] max,min
    - 求驻点值，和f(a),f(b)一起比大小
- 三个中值定理：假设函数 f，g 在闭区间 [a,b] 内连续, 在开区间 (a,b) 内可导, 
  - Rolle's Theorem 罗尔定理： $if f(a) = f(b) \exists c in (a,b) s.t. f'(c) = 0$
    ![罗尔定理](https://ss0.baidu.com/7Po3dSag_xI4khGko9WTAnF6hhy/baike/w%3D245/sign=9e0d5c1778ec54e741ec1d1a8c389bfd/574e9258d109b3de23b03541cfbf6c81800a4c88.jpg)

  - 拉格朗日中值定理: $\exists c in (a,b) s.t. \cfrac{f(b)-f(a)}{b-a}=f'(c)$
    ![拉格朗日中值定理](https://ss0.baidu.com/94o3dSag_xI4khGko9WTAnF6hhy/zhidao/pic/item/f11f3a292df5e0fea9ceda1c5e6034a85fdf72dc.jpg)
    
  - 柯西中值定理: $if g' \ne 0 then \exists c in (a,b) s.t. \cfrac{f(b)-f(a)}{g(b)-g(a)}=\cfrac{f'(c)}{g'(c)}$
    - $\because \cfrac{\cfrac{f(b)-f(a)}{b-a}}{\cfrac{g(b)-g(a)}{b-a}}=\cfrac{f'(c)}{g'(c)}$

- $y=x^2$
  - $dy/dx = ((x+dx)^2-x^2)/(dx)=(x^2+2xdx+dx^2-x^2)/dx=2x+dx =2x$
  - $dy/dx=nx^(n-1)$
- $y=sinx$
  - x=0 slope = 1, $x=\pi/2$ slope=0
  - $dy/dx=cosx$
- $y=e^x$
  - $dy/dx=e^x$
- 二阶导数
  - Accelerating, Bending 凹凸
  - $d^2y/dx^2=2$
    - >0 Bending up (convex)凸
    - <0 Bending down (concave)凹
    - =0
      - 是f'的局部极值
        - 这点是f的inflection point拐点
      - 是f'的水平拐点，比如$y=x^4$ x=0,不是f的拐点
- Product Rule乘法法则
  - $(fg)'=f'g+fg'$
    ![证明](https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fwww.pianshen.com%2Fimages%2F711%2F69ec7832392b723e36a1e217315e3b8f.png&refer=http%3A%2F%2Fwww.pianshen.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1640944053&t=b7ddf5cb57014be6880e25f88ee5fec7)

- Quotient Rule除法法则
  - $(f/g)'=f'(1/g)+f(1/g)'=  f'/g-fg'/g^2=\cfrac{f'g-fg'}{g^2}$ 母方分之（子导母-子母导）
- Chain Rule链式法则
  - $(f(g))'=f'g'$
  - $\because \cfrac{dz}{dx}=\cfrac{dz}{dy}\cfrac{dy}{dx}$
  - e.g. $((\sqrt{x})^2)'=2\sqrt{x}(\sqrt{x})'=1 \therefore (\sqrt{x})'=1/(2\sqrt{x})=1/2x^{-1/2}$
  - e.g. $z=e^{-x^2/2} \therefore z'=-xe^{-x^2/2} \therefore z''=(x^2-1)e^{-x^2/2}$ 钟形曲线，概率论

- Squeeze theorem夹逼定理：若有两个函数在某点的极限相同，且有第三个函数的值在这两个函数之间，则第三个函数在该点的极限也相同
- 隐函数求导
- Linear Approximation 
  - $f(x)\approx L(x)=f(a)+(x-a)f'(a)$
  - 误差 $r(x)=f(x)-L(x)=1/2f''(c)(x-a)^2$
- Newton's Method
  - $x-a\approx -\cfrac{F(a)}{F'(a)}$
  ![牛顿法](https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fwww.wendangwang.com%2Fpic%2F263b304ef32b37fcbfb6077c%2F16-810-jpg_6-1080-0-0-1080.jpg&refer=http%3A%2F%2Fwww.wendangwang.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1641031573&t=4069eeb76ae499cd6f9e64e9ba18673e)
  
  - 失效
    - f'(a)接近0
    - f(x)=0不止一个解
    - 近似可能变糟
    - 陷入循环

- Differential Equations微分方程
  - $m\cfrac{d^2y}{dt^2}+2r\cfrac{dy}{dt}+ky=0$ 弹簧震子运动，m质量，r是阻尼，k是弹簧系数
    - $y'=cy$的是$y(t)=y(0)+Ae^{ct}$
    - $y''=0的是C和y$
    - r=0 则 $-ky=m\cfrac{d^2y}{dt^2}$ 这是sin和cos
    - key: try $y=e^{\lambda t}$
    - $m\lambda^2 e^{\lambda t}+2r\lambda e^{\lambda t}+ke^{\lambda t}=0$
    - $m\lambda^2+2r\lambda+k=0$
    - $\lambda=\cfrac{-r \pm \sqrt{r^2-mk}}{m}$
    - e.g.$y''+6y'+ay=0$
      - a=8 判别式>0：$y=Ce^{-2t}+Dte^{-4t}$
      - a=10 判别式<0：根据欧拉公式会变cos和sin$y=Ce^{-3t}cost+Dte^{-3t}sint$
      - a=9 判别式=0：$y=Ce^{-3t}+Dte^{-3t}$
  - $y'=cy+s(source)$
    - $(y+s/c)'=c(y+s/c)$换元
    - $y(t)=Ae^{ct}-s/c$
    - 令t=0，$A=y(0)-s/c$
  - Linear Solution: $y(t)=y{particular function}(t)+y_{right side 0}(t)$
  - Growth
    - Population p(t)
      - $p'=cp-sp^2$
        - p'=0,then p=s/c, population is not changing
        - 令$y=1/p then \cfrac{dy}{dt}=p^{-2}p'=-\cfrac{cp-sp^2}{p^2}=-\cfrac{c-sp}{p}=s-cy$
        - $y(t)=(y(0)-s/c)e^{-ct}$ 代回去得p，p(0)人口普查得到
    - Predator-Prey Equation捕食猎物
      - $du/dt=-cu+suv, dv/dt=cv-suv$

## Integral积分
- 积分
  - 积分的中值定理(Mean Value Theorem for integrals): 连续函数在一段区间内至少一次达到它的平均值.
    - 函数 f 在区间 [a,b] 上连续, 那么在开区间 (a,b) 内总有一点 c, 满足$f(x)=\cfrac{1}{b-a}\int\limits_{a}^{b}f(x)\, dx$
  - 可积：f 为有界函数并在区间 [a, b] 上有限个不连续点
    - 函数 f(x) 的值在高度1 和2 之间来回跳跃, 任何一点都不连续
      - 勒贝格积分(Lebesgue integration)
  - 定积分：有端点
    - $\int\limits_{a}^{b}f(x)\, dx=F(b)-F(a)$
  - 不定积分
    - 收敛,发散
  - 反常积分
    - > improper反常积分: $f(垂直渐近线附近)=\infty$
      - >problem spot瑕点
  - Convergence tests审敛法
    - 看$\lim_{\epsilon \to 0}\int\limits_{a+\epsilon}^{b}f(x)\, dx$存在不
      - >收敛Convergence
        - e.g. 在x=0 $\cfrac{1}{\sqrt{x}}$
      - >发散Divergence
        - e.g. 在x=0 $\cfrac{1}{x}$
      - 比较判别法(理论)The Comparison Test：比发散大的也发散
      - 极限比较判别法(理论)The Limit Comparison Test：如两个函数在 x=a 是非常接近, 那么它们收敛或发散的行为是相同的.
        - 函数互为渐近线$x\rightarrow a$
          - 做差: $f(x)-g(x)=0$
          - 做商: $\cfrac{f(x)}{g(x)}=1$
          - 常用的g是$x^{-p}$
            - 上限$\infty$
              - p>1收敛
              - p<=1发散
            - 下限0
              - p<1收敛
              - p>=1发散
          - 记住$\cfrac{1}{x^2}$靠近x轴，$\cfrac{1}{x^1/2}$靠近y轴
        - 可以对渐近等价函数做相乘, 相除, 幂运算或变量替换都是适用的. 但加减关系并不适用!
        - e.g. $\int\limits_{0}^{1}\cfrac{1}{sin(\sqrt{x})}\, dx$收不收敛看$\int\limits_{0}^{1}\cfrac{1}{\sqrt{x}}\, dx$
      - 绝对收敛判别法：绝对值积分收敛，则去绝对值也收敛

### 重积分

## 数列和级数
- > 级数Series：数列各项和
  - 若数列极限不存在或$\ne 0$，级数肯定发散
- 重要数列
  - $a_n=r^n$
    - r=1 直线
    - r=2 指数函数
      - r=1/2 级数收敛
    - r=-1 上下反复
    - r=-2 右边上下发散震荡
      - r=-1/2 左边上下发散震荡 级数收敛
  - $a_n=(1+\cfrac{k}{n})^n$
    - $n \rightarrow \infty =e^k$
- 无穷级数
  - Tylor Series泰勒多项式
    ![tylor](/MathKT/tylor.png)  

    - $f(x)=f(a)+f'(a)(x-a)+\cfrac{1}{2!}f''(a)(x-a)^2+...$
      - Tylor近似定理：最近似的是Tylor展开到N: $P_{N(x)}$
        - Tylor定理： 误差 $R_{N(x)}=f(x)-P_{N(x)}=\cfrac{f^{N+1}(c)}{(N+1)!}(x-a)^{N+1}$
          - c是介于x与a之间的数
 
    - 麦克劳林:a=0
    - Radius of convergence收敛半径
  - Lagrange error bounds拉格朗日项余型

  - 参数方程和极坐标
  - 复数
  - 体积、弧长和表面积

# 多元微积分
## 多元函数微分法


# 线性代数
- [图解高等数学|线性代数](https://mp.weixin.qq.com/s?__biz=MzAxNzg3MTE3Ng==&mid=2247488295&idx=1&sn=9f83afda8442d877a3615b832401fb8b&chksm=9bdfab00aca822162f0c1014fcd6155dbcfa0565f664d7c04632e910e4ca5c3b7cbbcc9d3915&scene=21#wechat_redirect)
- 向量
- 内积/外积/混合积
- 一元/二元泰勒展开
- 偏导/方向导数/梯度
- 平面
- 二次曲面
- 空间曲线
- 全微分
- 导数/微分
- 多元函数极值/拉格朗日乘子法
- 二重积分
- 积分
- 三重积分
- 参数方程
- 第一类曲线积分
- 投影及其应用
- 第一类曲面积分
- 向量场
- 第二类曲面积分
- 极坐标
- 第二类曲面积分

$$
  \begin{split}
  \frac{\partial{\mathcal{E}}}{\partial{x_l}} & = 
  \frac{\partial{\mathcal{E}}}{\partial{x_L}}\frac{\partial{x_L}}{\partial{x_l}}\\\\
  & = \frac{\partial{\mathcal{E}}}{\partial{x_L}}\Big(1+\frac{\partial{}}{\partial{x_l}}\sum_{i=l}^{L-1}   
  \mathcal{F}(x_i,\mathcal{W}_i)\Big)
  \end{split}
$$


$$
A = \begin{bmatrix}
        a_{11}    & a_{12}    & ...    & a_{1n}\\
        a_{21}    & a_{22}    & ...    & a_{2n}\\
        a_{31}    & a_{22}    & ...    & a_{3n}\\
        \vdots    & \vdots    & \ddots & \vdots\\
        a_{n1}    & a_{n2}    & ... & a_{nn}\\
    \end{bmatrix} , b = \begin{bmatrix}
        b_{1}  \\
        b_{2}  \\
        b_{3}  \\
        \vdots \\
        b_{n}  \\
    \end{bmatrix}
$$

$\left|                --左边的竖线
\begin{array}{lcr}     --一个array的开始, l/c/r表示列的对齐方式左/中/右
a & b & c \\           --&分隔列 \\换行
d & e & f
\end{array}            --一个array的结束
\right|$               --右边的竖线

# 概率论
- 贝叶斯公式
$$
P(A_i \mid B) = \frac{P(B\mid A)P(A_i)}{\sum_{j=1}^{n}P(A_j)P(B \mid A_j)}
$$

## 排列组合

# Discrete mathematics离散数学
## 逻辑学
## 集合论（包括函数）
- > 幂集：所有子集的集合
- 康托尔定理


## 数论基础
## 算法设计
## 组合分析
## 离散概率
## 关系理论
## 图论与树
## 抽象代数（包括代数系统 群、环、域等）
## 布尔代数
## 计算模型（语言与自动机）
