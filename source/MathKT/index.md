---
title: 数学知识树
date: 2020-11-13 18:58:07
tags: Math
mathjax: true
---
# Mathjax
- [LaTeX 数学语法](https://uinika.gitee.io/Zen/LaTex/)

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
- 多项式
  - 二项式定理 $(a+b)^n$ = 杨辉三角系数$a^nb^0+....$
  - 幂函数
    ![幂函数](https://iknow-pic.cdn.bcebos.com/0ff41bd5ad6eddc4e8af90fb34dbb6fd52663361?x-bce-process%3Dimage%2Fresize%2Cm_lfit%2Cw_600%2Ch_800%2Climit_1%2Fquality%2Cq_85%2Fformat%2Cf_jpg)
    - $y=x^n$
      - 微积分
        - $(x^n)'=nx^{n-1}$
    - 抛物线
    - 双曲线
- exponential指数函数
  ![指数函数](https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fdoc.100lw.com%2Fpic%2Fdc9546940d38581fe517e443%2F1-509-png_6_0_0_462_84_329_230_892.979_1262.879-720-0-1530-720.jpg&refer=http%3A%2F%2Fdoc.100lw.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1640960606&t=a1421330a167398c24d3da616bcd8430)
  ![过(0,1)爆炸](https://gimg2.baidu.com/image_search/src=http%3A%2F%2Ffile1.renrendoc.com%2Ffileroot_temp2%2F2020-12%2F4%2Fa9a1e77a-e13b-4f04-9513-4e4b6fda31d0%2Fa9a1e77a-e13b-4f04-9513-4e4b6fda31d01.gif&refer=http%3A%2F%2Ffile1.renrendoc.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1640850738&t=13d07d665da6c0dde1c8a0138902ef59)
  - $幂=base底数^{exponent指数}$ 底数>0且$\ne \pm 1$
  - $y=a^x$
  - $a^{x+y}=a^xa^y$
  - $a^{xy}=(a^x)^y=(a^y)^x$
  - $a^nb^n=(ab)^n$
  - $y=e^x$
    - e怎么来的：满足$dy/dx=y$的
      - $\therefore y=1+x+\cfrac{x^2}{2!}+\cfrac{x^3}{3!}+...+\cfrac{x^n}{n!}$ (Tylor series泰勒级数)
        - $\cfrac{1}{1-x}=1+x+x^2+x^3+...+x^n$ Geographical series几何级数
      - x=1时 $\therefore e=1+1+1/2+1/6+...\approx 2.71828$ Euler's number
        - $(1+1/N)^N \rightarrow e$
          - 连续复利
      - $dy/dx=cy$ 则$y=e^ cx$
    - $e^xe^\Delta x=e^(x+\Delta x)$
      - $1+(x+\Delta x)+1/2(x+\Delta x)^2+1/6(x+\Delta x)^3$
  - 微积分
    - $(a^x)'=a^x\ln a$
    - 双曲函数
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
- 对数函数
  ![对数函数](https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fwww.wassk.cn%2FMyftp%2Fupload%2Fjlsj%2Ffile%2FcodeTempMain%2F201401%2FC20131206112713952%2F20140829154206624.jpg&refer=http%3A%2F%2Fwww.wassk.cn&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1640960683&t=2496dc2dea09ce69b40b6a43877f4862)

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
    - Tylor
      - $\ln(1-x)=x+\cfrac{x^2}{2}+\cfrac{x^3}{3}+\cfrac{x^4}{4}+...$

# 三角
![图像](https://gimg2.baidu.com/image_search/src=http%3A%2F%2Ffile1.renrendoc.com%2Ffileroot_temp2%2F2020-12%2F4%2Fa9a1e77a-e13b-4f04-9513-4e4b6fda31d0%2Fa9a1e77a-e13b-4f04-9513-4e4b6fda31d03.gif&refer=http%3A%2F%2Ffile1.renrendoc.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1640927932&t=0b46dabd561e152c6fd50dfb4a7b6fe9)

- 定义
  ![三角函数定义](https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fupload.wikimedia.org%2Fwikipedia%2Fcommons%2Fthumb%2Ff%2Ffe%2FUnit-circle_sin_cos_tan_cot_exsec_excsc_versin_cvs.svg%2F380px-Unit-circle_sin_cos_tan_cot_exsec_excsc_versin_cvs.svg.png&refer=http%3A%2F%2Fupload.wikimedia.org&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1640799665&t=5e27fd30870513af811713e86d8285d2)
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
    - $arcsin'x=\cfrac{1}{\sqrt{1-x^2}}$
      - 证明: $\sin(arcsinx)=x \therefore cos(arcsinx)arcsin'x=1 \therefore arcsin'x=\cfrac{1}{\sqrt{1-x^2}}$
    - Tylor
      - $sinx=x-\cfrac{x^3}{3!}+\cfrac{x^5}{5!}-\cfrac{x^7}{7!}+...$
  - $cos'x=-sinx$
    - 证明: $\cfrac{cos(x+\Delta x)-cosx} {\Delta x}=\cfrac{cosx(cos\Delta x-1)-sinxsin\Delta x} {\Delta x}=-sinx$
    - $arccos'x=-\cfrac{1}{\sqrt{1-x^2}}$
      - 证明: $\cos(arccosx)=x \therefore -sin(arccosx)arccos'x=1 \therefore so$
    - Tylor
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
  - 可导：左右导数都存在且相等：光滑
    - y=|x|在x=0处不可导，但连续
    - 魏尔斯特拉斯函数：连续但处处不可导


## 微分
- 一阶导数 Derivative
  - Speed, Slope
  - 求极值(stationary point驻点)=导数为0
    - max: 二阶导<0
    - min: 二阶导>0
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
  - $d^2y/dx^2=2>0$ : Bending up (convex)
  - <0 Bending down (concave)
  - =0 拐点 (inflection point)
- Product Rule乘法法则
  - $(fg)'=f'g+fg'$
    ![证明](https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fwww.pianshen.com%2Fimages%2F711%2F69ec7832392b723e36a1e217315e3b8f.png&refer=http%3A%2F%2Fwww.pianshen.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1640944053&t=b7ddf5cb57014be6880e25f88ee5fec7)

- Quotient Rule除法法则
  - $(f/g)'=f'(1/g)+f(1/g)'=  f'/g-fg'/g^2=\cfrac{f'g-fg'}{g^2}$ 母方分之（子导母-子母导）
- Chain Rule链式法则
  - $(f(g))'=f'g'$
  - $\because \cfrac{dz}{dx}=\cfrac{dz}{dy}\cfrac{dy}{dx}$
  - e.g. $((\sqrt{x})^2)'=2\sqrt{x}(\sqrt{x})'=1 \therefore (\sqrt{x})'=1/(2\sqrt{x})=1/2x^{-1/2}$
  - e.g. $z=e^{-x^2/2} \therefore z'=-xe^{-x^2/2} \therefore z''=(x^2-1)e^{-x^2/2}$ 钟形曲线
- Inverse function逆函数
  - $f^{-1}(x)$ f逆x
  - $\cfrac{dx}{dy}=\cfrac{1}{\cfrac{dy}{dx}}$
- Squeeze theorem夹逼定理
- 隐函数求导
- Linear Approximation
  - $f(x)\approx f(a)+(x-a)f'(a)$
- Newton's Method
  - $x-a\approx -\cfrac{F(a)}{F'(a)}$

## Integral积分

  - 指数函数和对数函数
  - 反函数和反三角函数
  - 最优化和线性化
  - 积分
  - 定积分
  - 微积分基本定理
  - 反常积分
  - 数列和级数
  - 泰勒多项式
  - 参数方程和极坐标
  - 复数
  - 体积、弧长和表面积

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



$\left                --左边的竖线
\begin{array}{lcr}     --一个array的开始, l/c/r表示列的对齐方式左/中/右
a & b & c \\           --&分隔列 \\换行
d & e & f
\end{array}            --一个array的结束
\right|$               --右边的竖线

# 概率论

## 排列组合

