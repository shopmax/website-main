<#--
Licensed to the Apache Software Foundation (ASF) under one
or more contributor license agreements.  See the NOTICE file
distributed with this work for additional information
regarding copyright ownership.  The ASF licenses this file
to you under the Apache License, Version 2.0 (the
"License"); you may not use this file except in compliance
with the License.  You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing,
software distributed under the License is distributed on an
"AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
KIND, either express or implied.  See the License for the
specific language governing permissions and limitations
under the License.
-->

<script>
(function(b) {
    var imageUrlPath = "<@ofbizContentUrl></@ofbizContentUrl>";
    var a = {
        init : function(c) {
            return this
                    .each(function() {
                        var d = this, h = b(d).empty();
                        d.opt = b.extend(true, {}, b.fn.raty.defaults, c);
                        h.data("settings", d.opt);
                        d.opt.number = a.between(d.opt.number, 0, 20);
                        if (d.opt.path.substring(d.opt.path.length - 1,
                                d.opt.path.length) != "/") {
                            d.opt.path += "/";
                        }
                        if (typeof d.opt.score == "function") {
                            d.opt.score = d.opt.score.call(d);
                        }
                        if (d.opt.score) {
                            d.opt.score = a.between(d.opt.score, 0,
                                    d.opt.number);
                        }
                        for ( var e = 1; e <= d.opt.number; e++) {
                            b(
                                    "<img />",
                                    {
                                        src : d.opt.path
                                                + ((!d.opt.score || d.opt.score < e) ? d.opt.starOff
                                                        : d.opt.starOn),
                                        alt : e,
                                        title : (e <= d.opt.hints.length && d.opt.hints[e - 1] !== null) ? d.opt.hints[e - 1]
                                                : e
                                    }).appendTo(d);
                            if (d.opt.space) {
                                h.append((e < d.opt.number) ? "&#160;" : "");
                            }
                        }
                        d.stars = h.children('img:not(".raty-cancel")');
                        d.score = b("<input />", {
                            type : "hidden",
                            name : d.opt.scoreName
                        }).appendTo(d);
                        if (d.opt.score && d.opt.score > 0) {
                            d.score.val(d.opt.score);
                            a.roundStar.call(d, d.opt.score);
                        }
                        if (d.opt.iconRange) {
                            a.fill.call(d, d.opt.score);
                        }
                        a.setTarget.call(d, d.opt.score, d.opt.targetKeep);
                        var g = d.opt.space ? 4 : 0, f = d.opt.width
                                || (d.opt.number * d.opt.size + d.opt.number
                                        * g);
                        if (d.opt.cancel) {
                            d.cancel = b("<img />", {
                                src : d.opt.path + d.opt.cancelOff,
                                alt : "x",
                                title : d.opt.cancelHint,
                                "class" : "raty-cancel"
                            });
                            if (d.opt.cancelPlace == "left") {
                                h.prepend("&#160;").prepend(d.cancel);
                            } else {
                                h.append("&#160;").append(d.cancel);
                            }
                            f += (d.opt.size + g);
                        }
                        if (d.opt.readOnly) {
                            a.fixHint.call(d);
                            if (d.cancel) {
                                d.cancel.hide();
                            }
                        } else {
                            h.css("cursor", "pointer");
                            a.bindAction.call(d);
                        }
                        h.css("width", f);
                    });
        },
        between : function(e, d, c) {
            return Math.min(Math.max(parseFloat(e), d), c);
        },
        bindAction : function() {
            var c = this, e = b(c);
            e.mouseleave(function() {
                var f = c.score.val() || undefined;
                a.initialize.call(c, f);
                a.setTarget.call(c, f, c.opt.targetKeep);
                if (c.opt.mouseover) {
                    c.opt.mouseover.call(c, f);
                }
            });
            var d = c.opt.half ? "mousemove" : "mouseover";
            if (c.opt.cancel) {
                c.cancel.mouseenter(function() {
                    b(this).attr("src", c.opt.path + c.opt.cancelOn);
                    c.stars.attr("src", c.opt.path + c.opt.starOff);
                    a.setTarget.call(c, null, true);
                    if (c.opt.mouseover) {
                        c.opt.mouseover.call(c, null);
                    }
                }).mouseleave(function() {
                    b(this).attr("src", c.opt.path + c.opt.cancelOff);
                    if (c.opt.mouseover) {
                        c.opt.mouseover.call(c, c.score.val() || null);
                    }
                }).click(function(f) {
                    c.score.removeAttr("value");
                    if (c.opt.click) {
                        c.opt.click.call(c, null, f);
                    }
                });
            }
            c.stars
                    .bind(
                            d,
                            function(g) {
                                var h = parseInt(this.alt, 10);
                                if (c.opt.half) {
                                    var f = parseFloat((g.pageX - b(this)
                                            .offset().left)
                                            / c.opt.size), i = (f > 0.5) ? 1
                                            : 0.5;
                                    h = parseFloat(this.alt) - 1 + i;
                                    a.fill.call(c, h);
                                    if (c.opt.precision) {
                                        h = h - i + f;
                                    }
                                    a.showHalf.call(c, h);
                                } else {
                                    a.fill.call(c, h);
                                }
                                e.data("score", h);
                                a.setTarget.call(c, h, true);
                                if (c.opt.mouseover) {
                                    c.opt.mouseover.call(c, h, g);
                                }
                            }).click(
                            function(f) {
                                c.score.val((c.opt.half || c.opt.precision) ? e
                                        .data("score") : this.alt);
                                if (c.opt.click) {
                                    c.opt.click.call(c, c.score.val(), f);
                                }
                            });
        },
        cancel : function(c) {
            return b(this).each(function() {
                var d = this, e = b(d);
                if (e.data("readonly") === true) {
                    return this;
                }
                if (c) {
                    a.click.call(d, null);
                } else {
                    a.score.call(d, null);
                }
                d.score.removeAttr("value");
            });
        },
        click : function(c) {
            return b(this)
                    .each(
                            function() {
                                if (b(this).data("readonly") === true) {
                                    return this;
                                }
                                a.initialize.call(this, c);
                                if (this.opt.click) {
                                    this.opt.click.call(this, c);
                                } else {
                                    a.error
                                            .call(this,
                                                    'you must add the "click: function(score, evt) { }" callback.');
                                }
                                a.setTarget.call(this, c, true);
                            });
        },
        error : function(c) {
            b(this).html(c);
            b.error(c);
        },
        fill : function(k) {
            var c = this, h = c.stars.length, g = 0, d, j, f;
            for ( var e = 1; e <= h; e++) {
                d = c.stars.eq(e - 1);
                if (c.opt.iconRange && c.opt.iconRange.length > g) {
                    j = c.opt.iconRange[g];
                    if (c.opt.single) {
                        f = (e == k) ? (j.on || c.opt.starOn)
                                : (j.off || c.opt.starOff);
                    } else {
                        f = (e <= k) ? (j.on || c.opt.starOn)
                                : (j.off || c.opt.starOff);
                    }
                    if (e <= j.range) {
                        d.attr("src", c.opt.path + f);
                    }
                    if (e == j.range) {
                        g++;
                    }
                } else {
                    if (c.opt.single) {
                        f = (e == k) ? c.opt.starOn : c.opt.starOff;
                    } else {
                        f = (e <= k) ? c.opt.starOn : c.opt.starOff;
                    }
                    d.attr("src", c.opt.path + f);
                }
            }
        },
        fixHint : function() {
            var c = b(this), e = parseInt(this.score.val(), 10), d = this.opt.noRatedMsg;
            if (!isNaN(e) && e > 0) {
                d = (e <= this.opt.hints.length && this.opt.hints[e - 1] !== null) ? this.opt.hints[e - 1]
                        : e;
            }
            c.data("readonly", true).css("cursor", "default").attr("title", d);
            this.score.attr("readonly", "readonly");
            this.stars.attr("title", d);
        },
        getScore : function() {
            var d = [], c;
            b(this).each(function() {
                c = this.score.val();
                d.push(c ? parseFloat(c) : undefined);
            });
            return (d.length > 1) ? d : d[0];
        },
        readOnly : function(c) {
            return this.each(function() {
                var d = b(this);
                if (d.data("readonly") === c) {
                    return this;
                }
                if (this.cancel) {
                    if (c) {
                        this.cancel.hide();
                    } else {
                        this.cancel.show();
                    }
                }
                if (c) {
                    d.unbind();
                    d.children("img").unbind();
                    a.fixHint.call(this);
                } else {
                    a.bindAction.call(this);
                    a.unfixHint.call(this);
                }
                d.data("readonly", c);
            });
        },
        reload : function() {
            return a.set.call(this, {});
        },
        roundStar : function(e) {
            var d = (e - Math.floor(e)).toFixed(2);
            if (d > this.opt.round.down) {
                var c = this.opt.starOn;
                if (d < this.opt.round.up && this.opt.halfShow) {
                    c = this.opt.starHalf;
                } else {
                    if (d < this.opt.round.full) {
                        c = this.opt.starOff;
                    }
                }
                this.stars.eq(Math.ceil(e) - 1).attr("src", this.opt.path + c);
            }
        },
        score : function() {
            return arguments.length ? a.setScore.apply(this, arguments)
                    : a.getScore.call(this);
        },
        set : function(c) {
            this.each(function() {
                var d = b(this), f = d.data("settings"), e = d.clone()
                        .removeAttr("style").insertBefore(d);
                d.remove();
                e.raty(b.extend(f, c));
            });
            return b(this.selector);
        },
        setScore : function(c) {
            return b(this).each(function() {
                if (b(this).data("readonly") === true) {
                    return this;
                }
                a.initialize.call(this, c);
                a.setTarget.call(this, c, true);
            });
        },
        setTarget : function(e, d) {
            if (this.opt.target) {
                var c = b(this.opt.target);
                if (c.length == 0) {
                    a.error.call(this, "target selector invalid or missing!");
                }
                var f = e;
                if (!d || f === undefined) {
                    f = this.opt.targetText;
                } else {
                    if (this.opt.targetType == "hint") {
                        f = (f === null && this.opt.cancel) ? this.opt.cancelHint
                                : this.opt.hints[Math.ceil(f - 1)];
                    } else {
                        f = this.opt.precision ? parseFloat(f).toFixed(1)
                                : parseInt(f, 10);
                    }
                }
                if (this.opt.targetFormat.indexOf("{score}") < 0) {
                    a.error.call(this, 'template "{score}" missing!');
                }
                if (e !== null) {
                    f = this.opt.targetFormat.toString().replace("{score}", f);
                }
                if (c.is(":input")) {
                    c.val(f);
                } else {
                    c.html(f);
                }
            }
        },
        showHalf : function(d) {
            var c = (d - Math.floor(d)).toFixed(1);
            if (c > 0 && c < 0.6) {
                this.stars.eq(Math.ceil(d) - 1).attr("src",
                        this.opt.path + this.opt.starHalf);
            }
        },
        initialize : function(c) {
            c = !c ? 0 : a.between(c, 0, this.opt.number);
            a.fill.call(this, c);
            if (c > 0) {
                if (this.opt.halfShow) {
                    a.roundStar.call(this, c);
                }
                this.score.val(c);
            }
        },
        unfixHint : function() {
            for ( var c = 0; c < this.opt.number; c++) {
                this.stars
                        .eq(c)
                        .attr(
                                "title",
                                (c < this.opt.hints.length && this.opt.hints[c] !== null) ? this.opt.hints[c]
                                        : c);
            }
            b(this).data("readonly", false).css("cursor", "pointer")
                    .removeAttr("title");
            this.score.attr("readonly", "readonly");
        }
    };
    b.fn.raty = function(c) {
        if (a[c]) {
            return a[c].apply(this, Array.prototype.slice.call(arguments, 1));
        } else {
            if (typeof c === "object" || !c) {
                return a.init.apply(this, arguments);
            } else {
                b.error("Method " + c + " does not exist!");
            }
        }
    };
    b.fn.raty.defaults = {
        cancel : false,
        cancelHint : "cancel this rating!",
        cancelOff : "cancel-off.png",
        cancelOn : "cancel-on.png",
        cancelPlace : "left",
        click : undefined,
        half : false,
        halfShow : true,
        hints : [ "bad", "poor", "regular", "good", "gorgeous" ],
        iconRange : undefined,
        mouseover : undefined,
        noRatedMsg : "not rated yet",
        number : 5,
        path : imageUrlPath+"/shopmax-default/img/",
        precision : false,
        round : {
            down : 0.25,
            full : 0.6,
            up : 0.76
        },
        readOnly : false,
        score : undefined,
        scoreName : "score",
        single : false,
        size : 16,
        space : true,
        starHalf : "star-half.png",
        starOff : "star-off.png",
        starOn : "star-on.png",
        target : undefined,
        targetFormat : "{score}",
        targetKeep : false,
        targetText : "",
        targetType : "hint",
        width : undefined
    };
})(jQuery);
</script>
